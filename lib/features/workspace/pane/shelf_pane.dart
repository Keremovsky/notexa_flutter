import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/constants/colors_constants.dart';
import 'package:flutter_mobile/core/extensions/context_extensions.dart';
import 'package:flutter_mobile/features/workspace/controller/workspace_controller.dart';
import 'package:flutter_mobile/features/workspace/models/selected_item_model.dart';
import 'package:flutter_mobile/features/workspace/state/shelf_pane_state.dart';
import 'package:flutter_mobile/features/workspace/widgets/document_item.dart';
import 'package:provider/provider.dart';

class ShelfPane extends StatefulWidget {
  final void Function(SelectedItem) onSelectedItemChanged;

  const ShelfPane({super.key, required this.onSelectedItemChanged});

  @override
  ShelfPaneState createState() => _ShelfPaneState();
}

class _ShelfPaneState extends ShelfPaneState {
  @override
  Widget build(BuildContext context) {
    return Consumer<WorkspaceController>(
      builder: (context, value, _) {
        final docs = value.workspace.documents;

        return Column(
          children: [
            Row(
              children: [
                Text(
                  value.workspace.name,
                  style: context.titleSmall,
                  overflow: TextOverflow.clip,
                ),
                Spacer(),
                SizedBox(
                  width: 25,
                  child: TextButton(
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
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 25,
                  child: TextButton(
                    onPressed: onDocumentUploadPressed,
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.zero),
                    ),
                    child: Icon(Icons.upload, size: 24),
                  ),
                ),
                SizedBox(width: 12),
              ],
            ),
            Divider(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  final doc = docs[index];

                  return DocumentItem(
                    selectedItem: selectedItem,
                    document: doc,
                    onDocumentPressed: () {
                      if (selectedItem.id == doc.id &&
                          selectedItem.type == SelectedItemType.document) {
                        return;
                      }

                      setState(() {
                        selectedItem = SelectedItem(
                          type: SelectedItemType.document,
                          id: doc.id,
                          name: doc.name,
                        );
                      });
                      widget.onSelectedItemChanged(selectedItem);
                    },
                    onNotePressed: (int id) {
                      if (selectedItem.id == id &&
                          selectedItem.type == SelectedItemType.note) {
                        return;
                      }
                      setState(() {
                        selectedItem = SelectedItem(
                          type: SelectedItemType.note,
                          id: id,
                          name: doc.notes
                              .firstWhere(((note) => note.id == id))
                              .title,
                        );
                      });
                      widget.onSelectedItemChanged(selectedItem);
                    },
                    onItemRemoved: () {
                      setState(() {
                        selectedItem = SelectedItem(
                          type: SelectedItemType.none,
                          id: -1,
                          name: "",
                        );
                      });
                      widget.onSelectedItemChanged(selectedItem);
                    },
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
    );
  }
}
