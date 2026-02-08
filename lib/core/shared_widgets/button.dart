import 'package:flutter/material.dart';
import 'package:todo_2026/core/constants/constants.dart' show blueColor;
import 'package:todo_2026/core/theme/app_text_styles.dart' show AppTextStyles;

Widget buttonValidate({
  required String title,
  required VoidCallback onPressed,
}) {
  return OutlinedButton(
    onPressed: onPressed,
    style: OutlinedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 15),
      foregroundColor: Colors.white,
      backgroundColor: blueColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      textStyle: AppTextStyles.buttonTextStyle,
    ),
    child: Text(title),
  );
}