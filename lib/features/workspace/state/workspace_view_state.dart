import 'package:flutter/material.dart';
import 'package:flutter_mobile/features/workspace/controller/workspace_controller.dart';
import 'package:flutter_mobile/features/workspace/view/workspace_view.dart';
import 'package:provider/provider.dart';

abstract class WorkspaceViewState extends State<WorkspaceView> {
  void onUploadDocumentPressed() async {
    await context.read<WorkspaceController>().uploadFileToWorkspace(0);
  }
}
