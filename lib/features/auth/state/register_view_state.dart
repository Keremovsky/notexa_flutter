import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/models/register_model/register_model.dart';
import 'package:flutter_mobile/core/utils/feedback_util.dart';
import 'package:flutter_mobile/core/utils/validators.dart';
import 'package:flutter_mobile/features/auth/controller/auth_controller.dart';
import 'package:flutter_mobile/features/auth/view/register_view.dart';
import 'package:flutter_mobile/gen/locale_keys.g.dart';
import 'package:provider/provider.dart';

abstract class RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();

  late String username;
  late String email;
  late String password;

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
  }

  void onUsernameSaved(String? value) {
    setState(() {
      username = value!;
    });
  }

  String? onUsernameValidate(String? value) {
    final control = InputFieldValidator.validateUsername(value);
    return control.toNullable()?.message;
  }

  void onEmailSaved(String? value) {
    setState(() {
      email = value!;
    });
  }

  String? onEmailValidate(String? value) {
    final control = InputFieldValidator.validateEmail(value);
    return control.toNullable()?.message;
  }

  void onPasswordSaved(String? value) {
    setState(() {
      password = value!;
    });
  }

  String? onPasswordValidate(String? value) {
    final control = InputFieldValidator.validatePassword(value);
    return control.toNullable()?.message;
  }

  String? onPasswordConfirmValidate(String? value) {
    final control = InputFieldValidator.validatePasswordConfirm(
      value,
      passwordController.text,
    );
    return control.toNullable()?.message;
  }

  Future<void> onRegisterButtonPressed() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final result = await context.read<AuthController>().register(
        RegisterModel(email: email, username: username, password: password),
      );

      result.fold(
        () {
          context.read<FeedbackUtil>().showSnackBar(
            context,
            LocaleKeys.registrationSuccess.tr(),
          );
          context.back();
        },
        (error) {
          context.read<FeedbackUtil>().showSnackBar(context, error.message);
        },
      );
    }
  }

  void onLoginAccountPressed() {
    context.back();
  }
}
