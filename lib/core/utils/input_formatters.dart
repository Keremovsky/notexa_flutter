import 'package:flutter/services.dart';

class InputFormatters {
  static final RegExp _spaceDisablePattern = RegExp(r'\s');
  static final RegExp _usernamePattern = RegExp(r'[a-zA-Z0-9_]');
  static final RegExp _emailPattern = RegExp(r'[a-zA-Z0-9@._\-]');
  static final RegExp _onlyDigitPattern = RegExp(r'[0-9]');

  static final List<TextInputFormatter> usernameFormatter = [
    FilteringTextInputFormatter.allow(_usernamePattern),
    LengthLimitingTextInputFormatter(20),
  ];

  static final List<TextInputFormatter> emailFormatter = [
    FilteringTextInputFormatter.deny(_spaceDisablePattern),
    FilteringTextInputFormatter.allow(_emailPattern),
  ];

  static final List<TextInputFormatter> passwordFormatter = [
    FilteringTextInputFormatter.deny(_spaceDisablePattern),
    LengthLimitingTextInputFormatter(16),
  ];

  static final List<TextInputFormatter> pinPutFormatter = [
    FilteringTextInputFormatter.allow(_onlyDigitPattern),
    LengthLimitingTextInputFormatter(4),
  ];
}
