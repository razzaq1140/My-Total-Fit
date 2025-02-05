import 'package:flutter/material.dart';

import 'app_text_theme.dart';
import 'color_scheme.dart';

class AppTheme {
  AppTheme._();

  factory AppTheme() {
    return instance;
  }

  static final AppTheme instance = AppTheme._();

  ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorSchemeLight,
      textTheme: appTextTheme,
      appBarTheme: appbarTheme,
      scaffoldBackgroundColor: Colors.white,
    );
  }
}

const appbarTheme = AppBarTheme(
  titleTextStyle: TextStyle(
      color: Color(0XFF000000), fontSize: 20, fontWeight: FontWeight.w700),
  backgroundColor: Color(0XFFFFFFFF),
  iconTheme: IconThemeData(color: Color(0XFF000000)),
  actionsIconTheme: IconThemeData(color: Color(0XFF000000)),
  elevation: 0.0,
  scrolledUnderElevation: 0.0,
  centerTitle: true,
);

final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    foregroundColor: WidgetStateProperty.all(
      const Color(0XFFFFFFFF),
    ),
    backgroundColor: const WidgetStatePropertyAll(Color(0XFF3F3BFF)),
    alignment: Alignment.center,
    textStyle: WidgetStateProperty.all(const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    )),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.0),
        side: BorderSide.none,
      ),
    ),
  ),
);

final outlinedButtonTheme = OutlinedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: const WidgetStatePropertyAll(Color(0XFFFFFFFF)),
    alignment: Alignment.center,
    textStyle: WidgetStateProperty.all(
        const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.6),
        side: const BorderSide(
          color: Color(0XFFBFBFBF),
        ),
      ),
    ),
  ),
);
