import 'package:flutter/material.dart';

import 'constants/app_color.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(size: 20),
      backgroundColor: AppColor.bg,
      elevation: 0,
      titleSpacing: 23,
      titleTextStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColor.bg,
    // textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
    //     .apply(bodyColor: AppColor.titleColor),
  );
}
