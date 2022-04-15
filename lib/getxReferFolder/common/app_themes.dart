import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppThemes {
  final String _themeMode = "theme_mode";
  final String _themeModeLight = "theme_mode_light";
  final String _themeModeDark = "theme_mode_dark";

  static const TextTheme _lightTextTheme = TextTheme(
    overline: TextStyle(
        // color: AppColor.textColor,
        ),
    headline1: TextStyle(
      fontSize: 40.0,
    ),
    headline2: TextStyle(
      fontSize: 30.0,
    ),
    headline4: TextStyle(
      fontSize: 24.0,
    ),
    headline5: TextStyle(
      fontSize: 20.0,
    ),
    bodyText1: TextStyle(
      fontSize: 16.0,
    ),
    bodyText2: TextStyle(
      fontSize: 14.0,
    ),
    button: TextStyle(
      fontSize: 15.0,
    ),
    headline6: TextStyle(
      fontSize: 16.0,
    ),
    subtitle1: TextStyle(
      fontSize: 16.0,
    ),
    caption: TextStyle(
      fontSize: 12.0,
    ),
  );

  static const TextTheme _darkTextTheme = TextTheme(
    overline: TextStyle(
        // color: AppColor.textColorDark,
        ),
    headline1: TextStyle(
      fontSize: 20.0,
    ),
    headline4: TextStyle(
      fontSize: 24.0,
    ),
    bodyText1: TextStyle(
      fontSize: 16.0,
    ),
    bodyText2: TextStyle(
      fontSize: 14.0,
    ),
    button: TextStyle(
      fontSize: 15.0,
    ),
    headline6: TextStyle(
      fontSize: 16.0,
    ),
    subtitle1: TextStyle(
      fontSize: 16.0,
    ),
    caption: TextStyle(
      fontSize: 12.0,
    ),
  );

  // static final ThemeData _lightTheme = ThemeData(
  //   primaryColor: AppColor.mainThemeColor,
  //   scaffoldBackgroundColor: AppColor.lightBackgroundColor,
  //   floatingActionButtonTheme: const FloatingActionButtonThemeData(
  //     backgroundColor: AppColor.mainThemeColor,
  //   ),
  //   appBarTheme: const AppBarTheme(
  //     brightness: Brightness.dark,
  //     color: AppColor.mainThemeColor,
  //     iconTheme: IconThemeData(color: AppColor.iconColor),
  //   ),
  //   colorScheme: const ColorScheme.light(
  //     primary: AppColor.mainThemeColor,
  //     primaryVariant: AppColor.mainThemeDarkerColor,
  //   ),
  //   snackBarTheme: const SnackBarThemeData(
  //     backgroundColor: AppColor.lightBackgroundColor,
  //   ),
  //   iconTheme: const IconThemeData(
  //     color: AppColor.iconColor,
  //   ),
  //   popupMenuTheme: const PopupMenuThemeData(
  //     color: AppColor.lightBackgroundColor,
  //   ),
  //   textTheme: _lightTextTheme,
  // );

  // static final ThemeData _darkTheme = ThemeData(
  //   brightness: Brightness.dark,
  //   primaryColor: AppColor.mainThemeColorDark,
  //   scaffoldBackgroundColor: AppColor.darkBackgroundColor,
  //   floatingActionButtonTheme: const FloatingActionButtonThemeData(
  //     backgroundColor: AppColor.mainThemeColorDark,
  //   ),
  //   appBarTheme: const AppBarTheme(
  //     brightness: Brightness.dark,
  //     color: AppColor.mainThemeColorDark,
  //     iconTheme: IconThemeData(color: AppColor.iconColorDark),
  //   ),
  //   colorScheme: const ColorScheme.dark(
  //     primary: AppColor.mainThemeColorDark,
  //     primaryVariant: AppColor.mainThemeDarkerColorDark,
  //   ),
  //   snackBarTheme: const SnackBarThemeData(
  //     backgroundColor: AppColor.darkBackgroundColor,
  //   ),
  //   iconTheme: const IconThemeData(
  //     color: AppColor.iconColorDark,
  //   ),
  //   popupMenuTheme: const PopupMenuThemeData(
  //     color: AppColor.darkBackgroundColor,
  //   ),
  //   textTheme: _darkTextTheme,
  // );

  // static ThemeData theme() {
  //   return _lightTheme;
  // }

  // static ThemeData darkTheme() {
  //   return _darkTheme;
  // }

  ThemeMode init() {
    final box = GetStorage();
    String? themeMode = box.read(_themeMode);
    if (themeMode == null) {
      box.write(_themeMode, _themeModeLight);
      return ThemeMode.light;
    } else if (themeMode == _themeModeLight) {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
  }

  void changeThemeMode(ThemeMode themeMode) {
    final box = GetStorage();
    if (themeMode == ThemeMode.dark) {
      box.write(_themeMode, _themeModeDark);
    } else {
      box.write(_themeMode, _themeModeLight);
    }
    Get.changeThemeMode(themeMode);
    Get.rootController.themeMode.reactive;
  }

  // ThemeData themeData() {
  //   final box = GetStorage();
  //   String? themeMode = box.read(_themeMode);
  //   if (themeMode == _themeModeLight) {
  //     return _lightTheme;
  //   }
  //   return _darkTheme;
  // }
}
