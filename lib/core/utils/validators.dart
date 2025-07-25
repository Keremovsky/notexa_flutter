import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_mobile/core/models/failure_model/failure_model.dart';
import 'package:flutter_mobile/gen/locale_keys.g.dart';
import 'package:fpdart/fpdart.dart';

class InputFieldValidator {
  static final List<String> _validDomains = ["gmail.com"];
  static final String _emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
  static final String _passwordPattern =
      r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*\W)(?!.* ).{8,16}$';

  static Option<FailureModel> validateEmptiness(String? input) {
    if (input == null || input.isEmpty) {
      return some(FailureModel.fail(LocaleKeys.emptyFieldMessage.tr()));
    }

    return none();
  }

  static Option<FailureModel> validateUsername(String? input) {
    if (input == null || input.isEmpty) {
      return some(FailureModel.fail(LocaleKeys.emptyFieldMessage.tr()));
    }

    if (input.length < 5) {
      return some(FailureModel.fail(LocaleKeys.invalidUsernameShortLength.tr()));
    } else if (input.length > 20) {
      return some(FailureModel.fail(LocaleKeys.invalidUsernameLongLength.tr()));
    }

    return none();
  }

  static Option<FailureModel> validateEmail(String? input) {
    if (input == null || input.isEmpty) {
      return some(FailureModel.fail(LocaleKeys.emptyFieldMessage.tr()));
    }

    final RegExp regex = RegExp(_emailPattern);

    if (!regex.hasMatch(input)) {
      return some(FailureModel.fail(LocaleKeys.invalidEmailMessage.tr()));
    }

    final String domain = input.split("@").last;

    if (!_validDomains.contains(domain)) {
      return some(FailureModel.fail(LocaleKeys.invalidEmailDomainMessage.tr()));
    }

    return none();
  }

  static Option<FailureModel> validatePassword(String? input) {
    if (input == null || input.isEmpty) {
      return some(FailureModel.fail(LocaleKeys.emptyFieldMessage.tr()));
    }

    final RegExp regex = RegExp(_passwordPattern);

    if (input.length < 8) {
      return some(
        FailureModel.fail(LocaleKeys.invalidPasswordShortLengthMessage.tr()),
      );
    } else if (input.length > 16) {
      return some(
        FailureModel.fail(LocaleKeys.invalidPasswordLongLengthMessage.tr()),
      );
    }

    if (!regex.hasMatch(input)) {
      return some(FailureModel.fail(LocaleKeys.invalidPasswordMessage.tr()));
    }

    return none();
  }

  static Option<FailureModel> validatePasswordConfirm(String? input, String pass) {
    if (input == null || input.isEmpty) {
      return some(FailureModel.fail(LocaleKeys.emptyFieldMessage.tr()));
    }

    final control = validatePassword(pass);
    return control.fold(
      () {
        if (input != pass) {
          return some(
            FailureModel.fail(LocaleKeys.invalidPasswordConfirmMatch.tr()),
          );
        }

        return none();
      },
      (message) {
        return some(message);
      },
    );
  }
}
