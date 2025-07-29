import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/features/workspace/pane/shelf_pane.dart';
import 'package:flutter_mobile/features/workspace/state/workspace_view_state.dart';

@RoutePage()
class WorkspaceView extends StatefulWidget {
  const WorkspaceView({super.key});

  @override
  WorkspaceViewState createState() => _WorkspaceViewState();
}

class _WorkspaceViewState extends WorkspaceViewState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          children: [
            Row(children: [ShelfPane()]),
          ],
        ),
      ),
    );
  }
}
