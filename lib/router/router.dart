import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/features/auth/view/login_view.dart';
import 'package:flutter_mobile/features/auth/view/register_view.dart';
import 'package:flutter_mobile/features/home/view/home_view.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Screen|Route|View")
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginViewRoute.page, initial: true),
    AutoRoute(page: RegisterViewRoute.page),
    AutoRoute(page: HomeViewRoute.page),
  ];
}
