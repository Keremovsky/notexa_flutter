import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/constants/colors_constants.dart';
import 'package:flutter_mobile/core/extensions/context_extensions.dart';
import 'package:flutter_mobile/features/workspace/controller/workspace_controller.dart';
import 'package:flutter_mobile/features/workspace/state/shelf_pane_state.dart';
import 'package:flutter_mobile/features/workspace/widgets/document_item.dart';
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
      height: context.screenHeight - 30,
      width: context.screenWidth * 0.2,
      child: Consumer<WorkspaceController>(
        builder: (context, value, _) {
          final docs = value.workspace.documents;

          return Column(
            children: [
              Row(
                children: [
                  Text(value.workspace.name, style: context.titleSmall),
                  Spacer(),
                  TextButton(
                    onPressed: onDeleteWorkspacePressed,
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.zero),
                    ),
                    child: Icon(
                      Icons.remove_circle_outline,
                      size: 24,
                      color: ColorConstants.red,
                    ),
                  ),
                  TextButton(
                    onPressed: onDocumentUploadPressed,
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.zero),
                    ),
                    child: Icon(Icons.upload, size: 24),
                  ),
                ],
              ),
              Divider(height: 20),
              Expanded(
                child: ListView.separated(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final doc = docs[index];
                    return DocumentItem(
                      isSelected: false,
                      document: doc,
                      onDocumentPressed: () {},
                      onNotePressed: () {},
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 20);
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
