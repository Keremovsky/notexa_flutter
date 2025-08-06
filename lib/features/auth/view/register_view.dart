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
import 'package:flutter_mobile/features/auth/state/register_view_state.dart';
import 'package:flutter_mobile/gen/locale_keys.g.dart';
import 'package:provider/provider.dart';

@RoutePage()
class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends RegisterViewState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 45),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
          child: Center(
            child: Column(
              children: [
                Spacer(),
                Text.rich(
                  TextSpan(
                    text: "${LocaleKeys.registerTo.tr()} ",
                    style: context.titleMedium,
                    children: [
                      TextSpan(
                        text: LocaleKeys.app.tr(),
                        style: context.titleMedium?.copyWith(
                          color: context.read<ThemeService>().isDarkTheme()
                              ? ColorConstants.darkMain
                              : ColorConstants.lightMain,
                        ),
                      ),
                    ],
                  ),
                ),
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
                        inputFormatters: InputFormatters.usernameFormatter,
                      ),
                      _Gap12H(),
                      CustomTextField(
                        onSaved: onEmailSaved,
                        validator: onEmailValidate,
                        hintText: LocaleKeys.email.tr(),
                        autovalidateMode: AutovalidateMode.onUnfocus,
                        textInputType: TextInputType.emailAddress,
                        inputFormatters: InputFormatters.emailFormatter,
                      ),
                      _Gap12H(),
                      CustomTextField(
                        onSaved: onPasswordSaved,
                        validator: onPasswordValidate,
                        controller: passwordController,
                        hintText: LocaleKeys.password.tr(),
                        obscureText: true,
                        autovalidateMode: AutovalidateMode.onUnfocus,
                        inputFormatters: InputFormatters.passwordFormatter,
                      ),
                      _Gap12H(),
                      CustomTextField(
                        validator: onPasswordConfirmValidate,
                        hintText: LocaleKeys.passwordAgain.tr(),
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        autovalidateMode: AutovalidateMode.onUnfocus,
                        inputFormatters: InputFormatters.passwordFormatter,
                      ),
                    ],
                  ),
                ),
                _Gap30H(),
                CustomButton(
                  onPressed: onRegisterButtonPressed,
                  child: Text(LocaleKeys.register.tr()),
                ),
                _Gap30H(),
                Text.rich(
                  TextSpan(
                    text: "${LocaleKeys.alreadyHaveAccount.tr()} ",
                    style: context.displaySmall,
                    children: [
                      TextSpan(
                        text: LocaleKeys.loginRightNow.tr(),
                        style: context.displaySmall?.copyWith(
                          color: context.read<ThemeService>().isDarkTheme()
                              ? ColorConstants.darkMain
                              : ColorConstants.lightMain,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = onLoginAccountPressed,
                      ),
                    ],
                  ),
                ),
                Spacer(flex: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Gap12H extends StatelessWidget {
  const _Gap12H();

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 12);
  }
}

class _Gap30H extends StatelessWidget {
  const _Gap30H();

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 30);
  }
}
