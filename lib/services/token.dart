// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class GetBearerToken {
  Future getToken() async {
    try {
      const storage = FlutterSecureStorage();
      String? token = await storage.read(key: 'token');
      // print(token.toString());

      return token.toString();
    } on DioError catch (e) {
      // ignore: avoid_print
      print('get token err');
      return e.toString();
    }
  }

  Future getRFtoken() async {
    try {
      const storage = FlutterSecureStorage();
      String? token = await storage.read(key: 'refeshtoken');

      return token.toString();
    } on DioError catch (e) {
      // ignore: avoid_print
      print('get refeshtoken err');
      return e.toString();
    }
  }
}
