import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/extensions/context_extensions.dart';
import 'package:flutter_mobile/features/chat/pane/chat_pane.dart';
import 'package:flutter_mobile/features/workspace/pane/content_pane.dart';
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
      appBar: AppBar(toolbarHeight: 45),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: context.screenHeight - 45,
                  width: context.screenWidth * 0.2 - 40,
                  child: ShelfPane(onSelectedItemChanged: onSelectedItemChanged),
                ),
                SizedBox(
                  height: context.screenHeight - 45,
                  width: context.screenWidth * 0.6,
                  child: ContentPane(selectedItem: item),
                ),
                SizedBox(
                  height: context.screenHeight - 45,
                  width: context.screenWidth * 0.2,
                  child: ChatPane(selectedItem: item),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
