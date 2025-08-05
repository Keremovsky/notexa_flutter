import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/models/failure_model/failure_model.dart';
import 'package:flutter_mobile/core/models/workspace_list_model/workspace_list_item_model.dart';
import 'package:flutter_mobile/core/utils/feedback_util.dart';
import 'package:flutter_mobile/features/auth/controller/auth_controller.dart';
import 'package:flutter_mobile/features/home/view/home_view.dart';
import 'package:flutter_mobile/features/workspace/controller/workspace_controller.dart';
import 'package:flutter_mobile/gen/locale_keys.g.dart';
import 'package:flutter_mobile/router/router.dart';
import 'package:fpdart/fpdart.dart' as fp;
import 'package:provider/provider.dart';

abstract class HomeViewState extends State<HomeView> {
  late Future<fp.Either<FailureModel, List<WorkspaceListItemModel>>> future;

  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    future = context.read<WorkspaceController>().getWorkspaces();
  }

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

  Future<void> onCreateWorkspacePressed() async {
    if (controller.text.isEmpty) {
      context.read<FeedbackUtil>().showSnackBar(
        context,
        LocaleKeys.emptyFieldMessage.tr(),
      );
      return;
    }
    if (controller.text.length > 20) {
      context.read<FeedbackUtil>().showSnackBar(
        context,
        LocaleKeys.invalidWorkspaceLongLength.tr(),
      );
      return;
    }
    final result = await context.read<WorkspaceController>().createWorkspace(
      controller.text,
    );

    result.fold(
      () {
        setState(() {
          future = context.read<WorkspaceController>().getWorkspaces();
          controller.text = "";
        });
      },
      (error) {
        context.read<FeedbackUtil>().showSnackBar(context, error.message);
      },
    );
  }
}
