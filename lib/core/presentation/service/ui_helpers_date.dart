import 'package:flutter/material.dart';

Future<DateTime?> showAppDatePicker({
  required BuildContext context, 
  initialDate
}) {
  return showDatePicker(
    context: context,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: DateTime.now(), 
    lastDate: DateTime(2050),
    confirmText: "OK",
    cancelText: 'Annuler'
  );
}