import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/extensions/context_extensions.dart';
import 'package:flutter_mobile/features/workspace/controller/workspace_controller.dart';
import 'package:flutter_mobile/features/workspace/state/shelf_pane_state.dart';
import 'package:provider/provider.dart';

class ShelfPane extends StatefulWidget {
  const ShelfPane({super.key});

  @override
  ShelfPaneState createState() => _ShelfPaneState();
}

class _ShelfPaneState extends ShelfPaneState {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth * 0.2,
      child: Consumer<WorkspaceController>(
        builder: (context, value, _) {
          final docs = value.workspace.documents;

          return Column(
            children: [
              Text(value.workspace.name),
              Expanded(
                child: ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final doc = docs[index];
                    return Column(
                      children: [
                        Text(doc.name),
                        ...doc.notes.map((note) => Text(note.title)),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
