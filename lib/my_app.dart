import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/constants/locale_constants.dart';
import 'package:flutter_mobile/core/constants/main_constants.dart';
import 'package:flutter_mobile/core/services/theme/theme_service.dart';
import 'package:flutter_mobile/router/router.dart';
import 'package:flutter_mobile/theme/theme.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: LocaleConstants.supportedLocales,
      path: LocaleConstants.path,
      fallbackLocale: LocaleConstants.en,
      child: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () => unFocus(context),
            child: const _MaterialApp(),
          );
        },
      ),
    );
  }

  void unFocus(BuildContext context) {
    final currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}

class _MaterialApp extends StatefulWidget {
  const _MaterialApp();

  @override
  __MaterialAppState createState() => __MaterialAppState();
}

class __MaterialAppState extends State<_MaterialApp> {
  @override
  void didChangeDependencies() {
    Intl.defaultLocale = context.locale.languageCode;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Provider.of<AppRouter>(context).config(),
      title: MainConstants.appName,
      localizationsDelegates:
          context.localizationDelegates + [FlutterQuillLocalizations.delegate],
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: context.watch<ThemeService>().currentTheme,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(
          context,
        ).copyWith(textScaler: TextScaler.noScaling, boldText: false),
        child: child!,
      ),
    );
  }
}
