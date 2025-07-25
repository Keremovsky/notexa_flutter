import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/constants/theme_constants.dart';
import 'package:flutter_mobile/core/extensions/context_extensions.dart';
import 'package:flutter_mobile/core/services/theme/theme_service.dart';
import 'package:flutter_mobile/core/utils/input_formatters.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class CustomPinput extends StatelessWidget {
  final int? length;
  final void Function(String)? onPinComplete;
  final String? Function(String?)? onValidatePin;

  const CustomPinput({
    super.key,
    this.length,
    this.onPinComplete,
    this.onValidatePin,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: length ?? 4,
      onCompleted: onPinComplete,
      validator: onValidatePin,
      errorTextStyle: context.bodySmall,
      inputFormatters: InputFormatters.pinPutFormatter,
      defaultPinTheme: context.read<ThemeService>().isLightTheme()
          ? ThemeConstants.lightDefaultPinTheme
          : ThemeConstants.darkDefaultPinTheme,
      errorPinTheme: context.read<ThemeService>().isLightTheme()
          ? ThemeConstants.lightErrorPinTheme
          : ThemeConstants.darkErrorPinTheme,
      focusedPinTheme: context.read<ThemeService>().isLightTheme()
          ? ThemeConstants.lightFocusedPinTheme
          : ThemeConstants.darkFocusedPinTheme,
    );
  }
}
