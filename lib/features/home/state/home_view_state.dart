import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/utils/feedback_util.dart';
import 'package:flutter_mobile/features/auth/controller/auth_controller.dart';
import 'package:flutter_mobile/features/home/view/home_view.dart';
import 'package:flutter_mobile/features/workspace/controller/workspace_controller.dart';
import 'package:flutter_mobile/router/router.dart';
import 'package:provider/provider.dart';

abstract class HomeViewState extends State<HomeView> {
  void onProfilePressed() {
    context.pushRoute(ProfileViewRoute());
  }

  void onSettingsPressed() {
    context.pushRoute(SettingsViewRoute());
  }

  void onExitPressed() async {
    final result = await context.read<AuthController>().logout();

    result.fold(
      () async {
        await context.router.replaceAll([LoginViewRoute()]);
      },
      (error) {
        context.read<FeedbackUtil>().showSnackBar(context, error.message);
      },
    );
  }

  Future<void> onWorkspacePressed(int id) async {
    await context.read<WorkspaceController>().getWorkspace(id);

    if (mounted) {
      context.pushRoute(WorkspaceViewRoute());
    }
  }
}
