import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/models/failure_model/failure_model.dart';
import 'package:flutter_mobile/core/models/workspace_list_model/workspace_list_item_model.dart';
import 'package:flutter_mobile/features/workspace/controller/workspace_controller.dart';
import 'package:flutter_mobile/features/workspace/view/workspace_view.dart';
import 'package:fpdart/fpdart.dart' as fp;
import 'package:provider/provider.dart';

abstract class WorkspaceViewState extends State<WorkspaceView> {
  void onUploadDocumentPressed() async {
    await context.read<WorkspaceController>().uploadFileToWorkspace(0);
  }
}
