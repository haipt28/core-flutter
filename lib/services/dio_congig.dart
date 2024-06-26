// ignore_for_file: body_might_complete_normally_catch_error, deprecated_member_use

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go/constants/constants.dart';
import 'package:go/presentation/widget/common/dialog.dart';
import 'package:go/services/navigator_key.dart';
import 'package:go/services/storage.dart';
import 'package:go/services/token.dart';

class DioConfig {
  // Khai báo một biến static để sử dụng singleton pattern
  static final DioConfig _instance = DioConfig._internal();

  // Khai báo một biến dio để lưu trữ đối tượng Dio
  late Dio dio;

  // token
  GetBearerToken getToken = GetBearerToken();

  final SecureStorage secureStorage = SecureStorage();

  // Hàm khởi tạo nội bộ
  DioConfig._internal() {
    // Tạo một đối tượng Dio mới
    dio = Dio();

    // Header mặc định cho các yêu cầu
    dio.options.baseUrl = SERVER_DOMAIN;
    dio.options.connectTimeout =
        const Duration(seconds: 30); // Thời gian tối đa để kết nối
    dio.options.receiveTimeout =
        const Duration(seconds: 30); // Thời gian tối đa để nhận dữ liệu
    dio.options.headers = {"Content-Type": "application/json"};

    // Interceptor để in ra log của các yêu cầu và phản hồi
    // dio.interceptors.add(LogInterceptor());

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        debugPrint(
            '${jsonEncode(options.method)} : ${jsonEncode(options.path)}');
        String token = await getToken.getToken();
        options.headers["Authorization"] = "Bearer $token";
        handler.next(options);
      },
      onError: (DioError error, ErrorInterceptorHandler handler) async {
        log('error message : ${error.message}');
        log('error response : ${error.response}');
        if (error.type == DioErrorType.connectionTimeout ||
            error.type == DioErrorType.receiveTimeout ||
            error.type == DioErrorType.sendTimeout) {
          log('Không thể kết nối tới máy chủ');
          CustomDialog.showDialogWithoutContext(
            title: 'Mất kết nối',
            text: 'Kết nối mất quá nhiều thời gian. Vui lòng thử lại.',
            onSubmit: () async {
              handler.resolve(await dio.fetch(error.requestOptions));
            },
            buttonText: 'Kết nối lại',
          );
          return handler.next(error);
        }
        String rfToken = await getToken.getRFtoken();

        if (error.response?.statusCode == 401) {
          switch (error.response?.data['message']) {
            case 'R_TOKEN_NOT_EXIST':
            case 'R_TOKEN_EXPIRED':
            case 'A_TOKEN_EXPIRED':
              deleteToken();
              return;
            case 'DATA_NOT_VALIDATE':
            case 'ERROR_LOGIN':
              return handler.next(error);
            case 'USER_NOT_VALIDATE':
            case 'Unauthorized':
              if (rfToken.isNotEmpty) {
                try {
                  var response = await dio.get('/renew-token/$rfToken');
                  var message = response.data['message'];
                  var accessToken = response.data['accessToken'];
                  if (message == 'RENEW_SUCCESS') {
                    log('RENEW_SUCCESS');
                    secureStorage.writeSecureData('token', accessToken);

                    error.requestOptions.headers["Authorization"] =
                        "Bearer ${response.data['accessToken']}";

                    return handler
                        .resolve(await dio.fetch(error.requestOptions));
                  } else {
                    deleteToken();
                    return;
                  }
                } catch (err) {
                  return handler.next(error);
                }
              } else {
                return handler.next(error);
              }
          }
        } else {
          return handler.next(error);
        }
      },
    ));
  }
  void deleteToken() {
    log('remove token');
    secureStorage.deleteSecureData('token');
    secureStorage.deleteSecureData('refeshtoken');

    navigatorKey.currentState
        ?.pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);

    CustomDialog.showDialogWithoutContext(
        text: 'Bạn đã bị đăng xuất từ một thiết bị khác.', onSubmit: () {});
  }

  factory DioConfig() {
    return _instance;
  }
}
