import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/constants/colors_constants.dart';
import 'package:flutter_mobile/core/constants/theme_constants.dart';

final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: ColorConstants.lightMain),
  primaryColor: ColorConstants.lightMain,
  scaffoldBackgroundColor: ColorConstants.lightScaffoldBackground,
  appBarTheme: ThemeConstants.lightAppBarTheme,
  textTheme: ThemeConstants.lightTextTheme,
  textButtonTheme: ThemeConstants.lightTextButtonThemeData,
  filledButtonTheme: ThemeConstants.lightFilledButtonThemeData,
  inputDecorationTheme: ThemeConstants.lightInputDecorationTheme,
  iconTheme: ThemeConstants.lightIconThemeData,
  textSelectionTheme: ThemeConstants.lightTextSelectionThemeData,
  switchTheme: ThemeConstants.lightSwitchThemeData,
  progressIndicatorTheme: ThemeConstants.lightProgressIndicatorThemeData,
  bottomSheetTheme: ThemeConstants.lightBottomSheetTheme,
  dialogTheme: ThemeConstants.lightDialogTheme,
);

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: ColorConstants.darkMain),
  primaryColor: ColorConstants.darkMain,
  scaffoldBackgroundColor: ColorConstants.darkScaffoldBackground,
  appBarTheme: ThemeConstants.darkAppBarTheme,
  textTheme: ThemeConstants.darkTextTheme,
  textButtonTheme: ThemeConstants.darkTextButtonThemeData,
  filledButtonTheme: ThemeConstants.darkFilledButtonThemeData,
  inputDecorationTheme: ThemeConstants.darkInputDecorationTheme,
  iconTheme: ThemeConstants.darkIconThemeData,
  textSelectionTheme: ThemeConstants.darkTextSelectionThemeData,
  switchTheme: ThemeConstants.darkSwitchThemeData,
  progressIndicatorTheme: ThemeConstants.darkProgressIndicatorThemeData,
  bottomSheetTheme: ThemeConstants.darkBottomSheetTheme,
  dialogTheme: ThemeConstants.darkDialogTheme,
);
