import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/constants/colors_constants.dart';
import 'package:flutter_mobile/core/extensions/context_extensions.dart';
import 'package:flutter_mobile/core/models/document_model/document_model.dart';
import 'package:flutter_mobile/core/utils/feedback_util.dart';
import 'package:flutter_mobile/features/workspace/controller/workspace_controller.dart';
import 'package:flutter_mobile/features/workspace/models/selected_item_model.dart';
import 'package:flutter_mobile/features/workspace/widgets/shelf_item.dart';
import 'package:provider/provider.dart';

class DocumentItem extends StatelessWidget {
  final double? height;
  final double? width;
  final SelectedItem selectedItem;
  final DocumentModel document;
  final void Function() onDocumentPressed;
  final void Function(int) onNotePressed;

  const DocumentItem({
    super.key,
    this.height,
    this.width,
    required this.selectedItem,
    required this.document,
    required this.onDocumentPressed,
    required this.onNotePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShelfItem(
          height: 40,
          isSelected:
              (selectedItem.type == SelectedItemType.document) &&
              (selectedItem.id == document.id),
          onPressed: onDocumentPressed,
          child: Row(
            children: [
              Text(document.name, style: context.displayLarge),
              Spacer(),
              SizedBox(
                width: 25,
                child: TextButton(
                  onPressed: () => _onNoteAdd(context, document.id),
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.zero),
                  ),
                  child: Icon(Icons.add, size: 20, color: ColorConstants.green),
                ),
              ),
              SizedBox(width: 10),
              SizedBox(
                width: 25,
                child: TextButton(
                  onPressed: () => _onDocumentRemovePressed(context, document.id),
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.zero),
                  ),
                  child: Icon(
                    Icons.remove_circle_outline,
                    size: 20,
                    color: ColorConstants.red,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SizedBox(
            height:
                (document.notes.length * 40) +
                max(0, document.notes.length - 1) * 10,
            child: ListView.separated(
              itemCount: document.notes.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final note = document.notes[index];

                return ShelfItem(
                  height: 40,
                  isSelected:
                      (selectedItem.type == SelectedItemType.note) &&
                      (selectedItem.id == note.id),
                  onPressed: () => onNotePressed(note.id),
                  child: Row(
                    children: [
                      Text(note.title, style: context.displayLarge),
                      Spacer(),
                      SizedBox(
                        width: 25,
                        child: TextButton(
                          onPressed: () => _onNoteRemovePressed(
                            context,
                            document.notes[index].id,
                          ),
                          style: ButtonStyle(
                            padding: WidgetStatePropertyAll(EdgeInsets.zero),
                          ),
                          child: Icon(
                            Icons.remove_circle_outline,
                            size: 20,
                            color: ColorConstants.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 10);
              },
            ),
          ),
        ),
      ],
    );
  }
}

Future<void> _onNoteAdd(BuildContext context, int id) async {
  final result = await context.read<FeedbackUtil>().showMessageBox(
    context,
    "Are you sure?",
    "Document will be deleted for forever. This action is not undone.",
  );

  if (result != null && result) {
    final result = await context.read<WorkspaceController>().addNoteToWorkspace(
      "note",
      id,
    );

    result.fold(() {}, (error) {
      context.read<FeedbackUtil>().showSnackBar(context, error.message);
    });
  }
}

Future<void> _onDocumentRemovePressed(BuildContext context, int id) async {
  final result = await context.read<FeedbackUtil>().showMessageBox(
    context,
    "Are you sure?",
    "Document will be deleted for forever. This action is not undone.",
  );

  if (result != null && result && context.mounted) {
    final result = await context
        .read<WorkspaceController>()
        .removeDocumentFromWorkspace(id);

    result.fold(() {}, (error) {
      context.read<FeedbackUtil>().showSnackBar(context, error.message);
    });
  }
}

Future<void> _onNoteRemovePressed(BuildContext context, int id) async {
  final result = await context.read<FeedbackUtil>().showMessageBox(
    context,
    "Are you sure?",
    "Document will be deleted for forever. This action is not undone.",
  );

  if (result != null && result && context.mounted) {
    final result = await context.read<WorkspaceController>().removeNoteFromWorkspace(
      id,
    );

    result.fold(() {}, (error) {
      context.read<FeedbackUtil>().showSnackBar(context, error.message);
    });
  }
}
