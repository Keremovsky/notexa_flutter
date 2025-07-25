import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/components/custom_button.dart';
import 'package:flutter_mobile/core/extensions/context_extensions.dart';
import 'package:flutter_mobile/gen/locale_keys.g.dart';

class FeedbackUtil {
  factory FeedbackUtil() => _instance;
  static final FeedbackUtil _instance = FeedbackUtil._init();

  FeedbackUtil._init() {
    log("FeedbackUtil is initialized");
  }

  bool _isSnackbarActive = false;

  void showSnackBar(
    BuildContext context,
    String text, {
    Duration duration = const Duration(seconds: 2),
  }) {
    if (_isSnackbarActive) {
      return;
    }

    _isSnackbarActive = true;

    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            content: Text(text, style: const TextStyle(fontSize: 14)),
            duration: duration,
            behavior: SnackBarBehavior.floating,
          ),
        )
        .closed
        .then((SnackBarClosedReason reason) {
          _isSnackbarActive = false;
        });
  }

  Future<bool?> showMessageBox(
    BuildContext context,
    String title,
    String content,
  ) async {
    return showDialog<bool?>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title, style: context.titleMedium),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text(content, style: context.displayLarge)],
            ),
          ),
          actions: <Widget>[
            CustomButton(
              onPressed: () {
                context.pop(false);
              },
              child: Text(LocaleKeys.refuse.tr()),
            ),
            CustomButton(
              onPressed: () {
                context.pop(true);
              },
              child: Text(LocaleKeys.approve.tr()),
            ),
          ],
        );
      },
    );
  }
}
