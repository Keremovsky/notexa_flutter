import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/models/login_model/login_model.dart';
import 'package:flutter_mobile/core/utils/feedback_util.dart';
import 'package:flutter_mobile/core/utils/validators.dart';
import 'package:flutter_mobile/features/auth/controller/auth_controller.dart';
import 'package:flutter_mobile/features/auth/view/login_view.dart';
import 'package:flutter_mobile/features/workspace/controller/workspace_controller.dart';
import 'package:flutter_mobile/router/router.dart';
import 'package:provider/provider.dart';

abstract class LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String username;
  late String password;

  void onUsernameSaved(String? value) {
    setState(() {
      username = value!;
    });
  }

  String? onUsernameValidate(String? value) {
    final control = InputFieldValidator.validateEmptiness(value);
    return control.toNullable()?.message;
  }

  void onPasswordSaved(String? value) {
    setState(() {
      password = value!;
    });
  }

  String? onPasswordValidate(String? value) {
    final control = InputFieldValidator.validateEmptiness(value);
    return control.toNullable()?.message;
  }

  Future<void> onLoginButtonPressed() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      final result = await context.read<AuthController>().login(
        LoginModel(username: username, password: password),
      );

      result.fold(
        () async {
          final result = await context.read<WorkspaceController>().getWorkspaces();

          result.fold(
            (error) {
              context.read<FeedbackUtil>().showSnackBar(context, error.message);
            },
            (workspaces) {
              widget.onSuccess != null
                  ? widget.onSuccess!()
                  : mounted
                  ? context.router.replaceAll([HomeViewRoute()])
                  : null;
            },
          );
        },
        (error) {
          context.read<FeedbackUtil>().showSnackBar(context, error.message);
        },
      );
    }
  }

  void onCreateAccountPressed() {
    context.pushRoute(RegisterViewRoute());
  }
}
