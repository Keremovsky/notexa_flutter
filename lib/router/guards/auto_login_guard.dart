import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_mobile/features/auth/controller/auth_controller.dart';
import 'package:flutter_mobile/router/router.dart';

class AutoLoginGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async {
    final data = await AuthController().autoLogin();

    data.fold(
      () {
        resolver.next();
      },
      (error) {
        log(error.message);

        resolver.redirectUntil(
          LoginViewRoute(
            onSuccess: () {
              resolver.next(true);
            },
          ),
        );
      },
    );
  }
}
