import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:flutter/material.dart';

class CustomWidgets {
  static customDialog({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String actionTxt,
    required Function() onAction,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: colorScheme(context).primary,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        alignment: Alignment.center,
        icon: Image.asset(
          AppImages.correct,
          width: screenWidth * 0.4,
          height: screenWidth * 0.4,
        ),
        title: Text(
          title,
          style: textTheme(context).titleLarge,
        ),
        content: Text(
          subtitle,
          textAlign: TextAlign.center,
          style: textTheme(context).bodyLarge,
        ),
        actions: [
          InkWell(
            onTap: onAction,
            child: Text(
              actionTxt,
              textAlign: TextAlign.center,
              style: textTheme(context).bodyLarge!.copyWith(
                    color: colorScheme(context).primary,
                    decoration: TextDecoration.underline,
                    decorationColor: colorScheme(context).primary,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
