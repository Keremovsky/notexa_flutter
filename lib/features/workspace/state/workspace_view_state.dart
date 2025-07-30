import 'package:flutter/material.dart';
import 'package:flutter_mobile/features/workspace/models/selected_item_model.dart';
import 'package:flutter_mobile/features/workspace/view/workspace_view.dart';

abstract class WorkspaceViewState extends State<WorkspaceView> {
  SelectedItem item = SelectedItem(type: SelectedItemType.none, id: -1, name: "");

  void onSelectedItemChanged(SelectedItem selectedItem) {
    setState(() {
      item = selectedItem;
    });
  }
}
