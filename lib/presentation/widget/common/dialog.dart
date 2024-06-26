import 'package:flutter/material.dart';
import 'package:go/services/navigator_key.dart';
import 'package:go/styles/app_colors.dart';

class CustomDialog {
  static void show({
    required BuildContext context,
    required String title,
    required String text,
    required Function onClose,
    required Function onSubmit,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(
            text,
            style: const TextStyle(
              // color: AppColors.textGrey,
              fontSize: 15,
            ),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                onClose();
                Navigator.of(context).pop();
              },
              child: const Text(
                'Hủy',
                style: TextStyle(
                  // color: AppColors.textGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FilledButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.black),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    // Change your radius here
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                onSubmit();
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static void delete({
    required BuildContext context,
    required String title,
    required String text,
    required Function onClose,
    required Function onSubmit,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Wrap(
            children: [
              const Text('Bạn có chắc muốn xóa'),
              Text(
                ' $text!',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                onClose();
                Navigator.of(context).pop();
              },
              child: const Text(
                'Hủy',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FilledButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.black),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    // Change your radius here
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              onPressed: () {
                onSubmit();
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static void showDialogWithoutContext({
    String title = 'Thông báo',
    String buttonText = 'ĐÓNG',
    required String text,
    required Function onSubmit,
  }) {
    showDialog(
      context: navigatorKey.currentState!.overlay!.context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        void onPressSubmit() {
          onSubmit();
          Navigator.of(context).pop();
        }

        return AlertDialog(
          alignment: Alignment.center,
          actionsOverflowAlignment: OverflowBarAlignment.center,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          content: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            FilledButton(
              onPressed: onPressSubmit,
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  static void custom({
    required BuildContext context,
    required String title,
    required Function onClose,
    required Function onSubmit,
    required Widget content,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: content,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                onClose();
                Navigator.of(context).pop();
              },
              child: const Text(
                'Hủy',
                style: TextStyle(
                  // color: AppColors.textGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FilledButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.black),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    // Change your radius here
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                onSubmit();
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
