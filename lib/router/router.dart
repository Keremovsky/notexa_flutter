import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/models/workspace_list_model/workspace_list_item_model.dart';
import 'package:flutter_mobile/features/auth/view/login_view.dart';
import 'package:flutter_mobile/features/auth/view/register_view.dart';
import 'package:flutter_mobile/features/home/view/home_view.dart';
import 'package:flutter_mobile/features/home/view/profile_view.dart';
import 'package:flutter_mobile/features/home/view/settings_view.dart';
import 'package:flutter_mobile/features/workspace/view/workspace_view.dart';
// ignore: deprecated_member_use
import 'package:collection/equality.dart';
import 'package:flutter_mobile/router/guards/auto_login_guard.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Screen|Route|View")
class AppRouter extends RootStackRouter {
  static final AppRouter _instance = AppRouter._init();
  factory AppRouter() => _instance;

  AppRouter._init();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginViewRoute.page),
    AutoRoute(page: RegisterViewRoute.page),
    AutoRoute(page: HomeViewRoute.page, initial: true, guards: [AutoLoginGuard()]),
    AutoRoute(page: ProfileViewRoute.page),
    AutoRoute(page: SettingsViewRoute.page),
    AutoRoute(page: WorkspaceViewRoute.page),
  ];
}
