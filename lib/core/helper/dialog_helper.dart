import 'package:dewakoding_kasir/core/helper/global_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DialogHelper {
  static showSnackBar({required BuildContext context, required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  static showBottomSheetDialog(
      {required BuildContext context,
      required String title,
      bool canDismiss = true,
      required Widget content}) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      isDismissible: canDismiss,
      enableDrag: canDismiss,
      builder: (context) => SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.only(
            right: 20,
            left: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GlobalHelper.getTextTheme(context,
                          appTextStyle: AppTextStyle.TITLE_MEDIUM)
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                (canDismiss)
                    ? IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close))
                    : SizedBox()
              ],
            ),
            SizedBox(
              height: 20,
            ),
            content
          ],
        ),
      )),
    );
  }
}
