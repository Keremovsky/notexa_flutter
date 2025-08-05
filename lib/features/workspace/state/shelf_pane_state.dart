import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/utils/feedback_util.dart';
import 'package:flutter_mobile/features/workspace/controller/workspace_controller.dart';
import 'package:flutter_mobile/features/workspace/models/selected_item_model.dart';
import 'package:flutter_mobile/features/workspace/pane/shelf_pane.dart';
import 'package:flutter_mobile/router/router.dart';
import 'package:provider/provider.dart';

abstract class ShelfPaneState extends State<ShelfPane> {
  SelectedItem selectedItem = SelectedItem(
    type: SelectedItemType.none,
    id: -1,
    name: "",
  );

  void onDeleteWorkspacePressed() async {
    final result = await context.read<FeedbackUtil>().showMessageBox(
      context,
      "Are you sure?",
      "Workspace will be deleted for forever. This action cannot be undone.",
    );

    if (result != null && result && mounted) {
      final currentWorkspaceId = context.read<WorkspaceController>().workspace.id;

      final result = await context.read<WorkspaceController>().removeWorkspace(
        currentWorkspaceId,
      );

      result.fold(
        () {
          context.router.replaceAll([HomeViewRoute()]);
        },
        (error) {
          context.read<FeedbackUtil>().showSnackBar(context, error.message);
        },
      );
    }
  }

  void onDocumentUploadPressed() async {
    final workspace = context.read<WorkspaceController>().workspace;
    final result = await context.read<WorkspaceController>().uploadFileToWorkspace(
      workspace.id,
    );

    result.fold(() async {}, (error) {
      context.read<FeedbackUtil>().showSnackBar(context, error.message);
    });
  }
}
