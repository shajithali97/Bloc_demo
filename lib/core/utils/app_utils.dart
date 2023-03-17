import 'package:flutter/material.dart';

import '../constants/app_color.dart';

class AppUtils {
// Show SnackBar
  static showSnackBar(BuildContext context, String message,
      {Color backgroundColor = AppColor.errorColor}) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
