import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/constants/colors_constants.dart';
import 'package:flutter_mobile/core/constants/size_constants.dart';
import 'package:flutter_mobile/core/constants/text_style_constants.dart';
import 'package:pinput/pinput.dart';

class ThemeConstants {
  static final lightAppBarTheme = AppBarTheme(
    iconTheme: lightIconThemeData,
    actionsIconTheme: lightIconThemeData,
    titleTextStyle: TextStyleConstants.titleSmall,
    foregroundColor: ColorConstants.lightScaffoldBackground,
    backgroundColor: ColorConstants.lightScaffoldBackground,
    scrolledUnderElevation: 0,
    elevation: 0,
    centerTitle: true,
  );

  static final darkAppBarTheme = lightAppBarTheme.copyWith(
    iconTheme: darkIconThemeData,
    actionsIconTheme: darkIconThemeData,
    titleTextStyle: TextStyleConstants.titleSmall.copyWith(
      color: ColorConstants.whiteText,
    ),
    foregroundColor: ColorConstants.darkScaffoldBackground,
    backgroundColor: ColorConstants.darkScaffoldBackground,
  );

  static final lightTextButtonThemeData = TextButtonThemeData(
    style: ButtonStyle(
      side: const WidgetStatePropertyAll(BorderSide.none),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 28, vertical: 16),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyleConstants.displayLarge as TextStyle?,
      ),
      foregroundColor: const WidgetStatePropertyAll(ColorConstants.blackText),
      elevation: const WidgetStatePropertyAll(0),
      splashFactory: NoSplash.splashFactory,
    ),
  );

  static final darkTextButtonThemeData = TextButtonThemeData(
    style: ButtonStyle(
      side: const WidgetStatePropertyAll(BorderSide.none),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 28, vertical: 16),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyleConstants.displayLarge as TextStyle?,
      ),
      foregroundColor: const WidgetStatePropertyAll(ColorConstants.whiteText),
      elevation: const WidgetStatePropertyAll(0),
      splashFactory: NoSplash.splashFactory,
    ),
  );

  static final lightFilledButtonThemeData = FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color>(
        (states) => ColorConstants.lightFilledButton,
      ),
      side: const WidgetStatePropertyAll(BorderSide.none),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 28, vertical: 16),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyleConstants.displayLarge as TextStyle?,
      ),
      foregroundColor: const WidgetStatePropertyAll(ColorConstants.blackText),
      elevation: const WidgetStatePropertyAll(2),
    ),
  );

  static final darkFilledButtonThemeData = FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color>(
        (states) => ColorConstants.darkFilledButton,
      ),
      side: const WidgetStatePropertyAll(BorderSide.none),
      padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 22)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyleConstants.displayLarge as TextStyle?,
      ),
      foregroundColor: const WidgetStatePropertyAll(ColorConstants.whiteText),
      elevation: const WidgetStatePropertyAll(2),
    ),
  );

  static final lightInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: ColorConstants.lightScaffoldBackground,
    hintStyle: TextStyleConstants.bodyMedium,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    errorStyle: TextStyleConstants.bodySmall,
    errorMaxLines: 1,
    contentPadding: EdgeInsets.symmetric(
      horizontal: SizeConstants.inputFieldHorizontalPadding,
      vertical: SizeConstants.inputFieldVerticalPadding,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: ColorConstants.lightInputAreaBorder,
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: ColorConstants.lightInputAreaFocusedBorder,
        width: 1,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: ColorConstants.lightInputAreaBorder,
        width: 1,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: ColorConstants.inputAreaErrorBorder,
        width: 1,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: ColorConstants.inputAreaErrorBorder,
        width: 1,
      ),
    ),
    constraints: const BoxConstraints(maxWidth: 360),
    iconColor: ColorConstants.lightInputAreaIcon,
    hoverColor: ColorConstants.lightInputAreaBackground,
  );

  static final darkInputDecorationTheme = lightInputDecorationTheme.copyWith(
    fillColor: ColorConstants.darkScaffoldBackground,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: ColorConstants.darkInputAreaBorder,
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: ColorConstants.darkInputAreaFocusedBorder,
        width: 1,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: ColorConstants.darkInputAreaBorder,
        width: 1,
      ),
    ),
    iconColor: ColorConstants.darkInputAreaIcon,
    hoverColor: ColorConstants.darkInputAreaBackground,
  );

  static final lightTextSelectionThemeData = TextSelectionThemeData(
    cursorColor: ColorConstants.lightTextCursor,
  );

  static final darkTextSelectionThemeData = lightTextSelectionThemeData.copyWith(
    cursorColor: ColorConstants.darkTextCursor,
    selectionColor: ColorConstants.darkInputAreaFocusedBorder,
  );

  static final lightIconThemeData = const IconThemeData(
    color: ColorConstants.darkScaffoldBackground,
    size: 24,
  );

  static final darkIconThemeData = lightIconThemeData.copyWith(
    color: ColorConstants.lightScaffoldBackground,
  );

  static final lightTextTheme = TextTheme(
    titleLarge: TextStyleConstants.titleLarge,
    titleMedium: TextStyleConstants.titleMedium,
    titleSmall: TextStyleConstants.titleSmall,
    displayLarge: TextStyleConstants.displayLarge,
    displayMedium: TextStyleConstants.displayMedium,
    displaySmall: TextStyleConstants.displaySmall,
    bodyMedium: TextStyleConstants.bodyMedium,
    bodySmall: TextStyleConstants.bodySmall,
  );

  static final darkTextTheme = TextTheme(
    titleLarge: TextStyleConstants.titleLarge.copyWith(
      color: ColorConstants.whiteText,
    ),
    titleMedium: TextStyleConstants.titleSmall.copyWith(
      color: ColorConstants.whiteText,
    ),
    displayLarge: TextStyleConstants.displayLarge.copyWith(
      color: ColorConstants.whiteText,
    ),
    displayMedium: TextStyleConstants.displayMedium.copyWith(
      color: ColorConstants.whiteText,
    ),
    displaySmall: TextStyleConstants.displaySmall.copyWith(
      color: ColorConstants.darkGreyTextColor,
    ),
    bodyMedium: TextStyleConstants.bodyMedium,
    bodySmall: TextStyleConstants.bodySmall,
  );

  static final lightSwitchThemeData = const SwitchThemeData(
    thumbColor: WidgetStatePropertyAll(ColorConstants.whiteText),
    trackColor: WidgetStatePropertyAll(ColorConstants.darkScaffoldBackground),
    trackOutlineColor: WidgetStatePropertyAll(ColorConstants.lightInputAreaBorder),
  );

  static final darkSwitchThemeData = const SwitchThemeData(
    thumbColor: WidgetStatePropertyAll(ColorConstants.blackText),
    trackColor: WidgetStatePropertyAll(ColorConstants.lightScaffoldBackground),
    trackOutlineColor: WidgetStatePropertyAll(ColorConstants.darkInputAreaBorder),
  );

  static final lightProgressIndicatorThemeData = const ProgressIndicatorThemeData(
    color: ColorConstants.lightInputAreaBorder,
  );

  static final darkProgressIndicatorThemeData = const ProgressIndicatorThemeData(
    color: ColorConstants.darkInputAreaBorder,
  );

  // PinPut themes
  static final lightDefaultPinTheme = PinTheme(
    height: 77,
    width: 77,
    textStyle: TextStyleConstants.displayLarge,
    decoration: BoxDecoration(
      color: ColorConstants.lightInputAreaBackground,
      border: Border.all(color: ColorConstants.lightInputAreaBorder),
      borderRadius: BorderRadius.circular(15),
    ),
  );

  static final lightErrorPinTheme = lightDefaultPinTheme.copyDecorationWith(
    border: Border.all(color: ColorConstants.inputAreaErrorBorder),
  );

  static final lightFocusedPinTheme = lightDefaultPinTheme.copyDecorationWith(
    border: Border.all(color: ColorConstants.lightInputAreaFocusedBorder),
  );

  static final darkDefaultPinTheme = lightDefaultPinTheme.copyWith(
    textStyle: TextStyleConstants.displayLarge.copyWith(
      color: ColorConstants.whiteText,
    ),
    decoration: BoxDecoration(
      color: ColorConstants.darkInputAreaBackground,
      border: Border.all(color: ColorConstants.darkInputAreaBorder),
      borderRadius: BorderRadius.circular(15),
    ),
  );

  static final darkErrorPinTheme = darkDefaultPinTheme.copyDecorationWith(
    border: Border.all(color: ColorConstants.inputAreaErrorBorder),
  );

  static final darkFocusedPinTheme = darkDefaultPinTheme.copyDecorationWith(
    border: Border.all(color: ColorConstants.darkInputAreaFocusedBorder),
  );

  static final lightBottomSheetTheme = const BottomSheetThemeData(
    backgroundColor: ColorConstants.lightScaffoldBackground,
    showDragHandle: true,
  );

  static final darkBottomSheetTheme = lightBottomSheetTheme.copyWith(
    backgroundColor: ColorConstants.darkScaffoldBackground,
  );

  static final lightDialogTheme = const DialogThemeData(
    backgroundColor: ColorConstants.lightScaffoldBackground,
    elevation: 0,
  );

  static final darkDialogTheme = lightDialogTheme.copyWith(
    backgroundColor: ColorConstants.darkScaffoldBackground,
  );
}
