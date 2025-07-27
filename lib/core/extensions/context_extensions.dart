import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension SizeExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
}

extension ThemeExtension on BuildContext {
  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;
  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;
  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;
  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;
  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;
  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;
  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;
  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;
  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;
  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;
  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;
  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;
}

extension LanguageExtension on BuildContext {
  bool isLang(Locale lang) => locale.languageCode == lang.languageCode;
}
