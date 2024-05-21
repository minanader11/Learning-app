import 'package:flutter/material.dart';
import 'package:mario_app/core/theme/colors.dart';
import 'package:mario_app/core/theme/text_styles.dart';

class DialogUtils {
  static showLoading(
      {required BuildContext context, bool isDismissible = true}) {
    showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: MyColors.whiteColor,
          content: Row(children: [
            Text(
              'Loading',
              style: Styles.textStyle20.copyWith(color: MyColors.purpleColor),
            ),
            SizedBox(
              width: 12,
            ),
            CircularProgressIndicator(
              color: MyColors.purpleColor,
            )
          ]),
        );
      },
    );
  }

  static hideLoading(BuildContext context) {
    Navigator.of(context).pop();
  }

  static showMessage(
      {required BuildContext context,
      required String message,
      String? title,
      required String actionName,
      Function? posActionFun}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: MyColors.whiteColor,
          content: Text(
            message,
            style: Styles.textStyle20.copyWith(color: MyColors.purpleColor),
          ),
          title: Text(title ?? ''),
          actions: [
            TextButton(
                onPressed: () {
                  if (posActionFun != null) {
                    posActionFun.call();
                  }
                  // Navigator.of(context).pop();
                },
                child: Text(
                  actionName,
                  style:
                      Styles.textStyle16.copyWith(color: MyColors.purpleColor),
                ))
          ],
        );
      },
    );
  }
}
