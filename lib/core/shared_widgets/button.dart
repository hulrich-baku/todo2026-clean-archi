import 'package:flutter/material.dart';

Widget buttonValidate({
  required String title,
  required VoidCallback onPressed,
}) {
  return OutlinedButton(
    onPressed: onPressed,
    style: OutlinedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 15),
      foregroundColor: Colors.white,
      // backgroundColor: blueColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)
    ),
    child: Text(title),
  );
}