import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/components/custom_button.dart';
import 'package:flutter_mobile/core/components/custom_text_field.dart';
import 'package:flutter_mobile/core/constants/colors_constants.dart';
import 'package:flutter_mobile/core/extensions/context_extensions.dart';
import 'package:flutter_mobile/core/services/theme/theme_service.dart';
import 'package:flutter_mobile/core/utils/input_formatters.dart';
import 'package:flutter_mobile/features/auth/state/login_view_state.dart';
import 'package:flutter_mobile/gen/locale_keys.g.dart';
import 'package:provider/provider.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  final void Function()? onSuccess;

  const LoginView({super.key, this.onSuccess});

  @override
  LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends LoginViewState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
          child: Column(
            children: [
              Spacer(),
              _TitleText(),
              Spacer(),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      onSaved: onUsernameSaved,
                      validator: onUsernameValidate,
                      hintText: LocaleKeys.username.tr(),
                      autovalidateMode: AutovalidateMode.onUnfocus,
                      textInputType: TextInputType.name,
                      inputFormatters: InputFormatters.usernameFormatter,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      onSaved: onPasswordSaved,
                      validator: onPasswordValidate,
                      hintText: LocaleKeys.password.tr(),
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      autovalidateMode: AutovalidateMode.onUnfocus,
                      inputFormatters: InputFormatters.passwordFormatter,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              CustomButton(
                onPressed: onLoginButtonPressed,
                child: Text(LocaleKeys.login.tr()),
              ),
              const SizedBox(height: 30),
              Text.rich(
                TextSpan(
                  text: "${LocaleKeys.dontHaveAccount.tr()} ",
                  style: context.displaySmall,
                  children: [
                    TextSpan(
                      text: LocaleKeys.createRightNow.tr(),
                      style: context.displaySmall?.copyWith(
                        color: context.read<ThemeService>().isDarkTheme()
                            ? ColorConstants.darkMain
                            : ColorConstants.lightMain,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = onCreateAccountPressed,
                    ),
                  ],
                ),
              ),
              Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}

class _TitleText extends StatelessWidget {
  const _TitleText();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("${LocaleKeys.welcomeTo.tr()} ", style: context.titleSmall),
        Text(
          LocaleKeys.app.tr(),
          style: context.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.read<ThemeService>().isDarkTheme()
                ? ColorConstants.darkMain
                : ColorConstants.lightMain,
          ),
        ),
      ],
    );
  }
}
