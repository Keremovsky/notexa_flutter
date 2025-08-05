import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/components/custom_loading_indicator.dart';
import 'package:flutter_mobile/core/extensions/context_extensions.dart';
import 'package:flutter_mobile/features/workspace/models/selected_item_model.dart';
import 'package:flutter_mobile/features/workspace/state/content_pane_state.dart';
import 'package:flutter_mobile/features/workspace/widgets/note_pane_view.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ContentPane extends StatefulWidget {
  final SelectedItem selectedItem;

  const ContentPane({super.key, required this.selectedItem});

  @override
  ContentPaneState createState() => _ContentPaneState();
}

class _ContentPaneState extends ContentPaneState {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: FutureBuilder(
        key: ValueKey(
          widget.selectedItem.id.toString() + widget.selectedItem.type.toString(),
        ),
        future: future,
        builder: (context, snapshot) {
          final data = snapshot.data;

          if (data == null) {
            return Text("An unknown error occurred.", style: context.displayLarge);
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return data.fold(
              (file) {
                return SfPdfViewer.file(file);
              },
              (right) {
                return right.fold(
                  (error) {
                    if (error.message.isEmpty) {
                      return Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Please select a note or document :)",
                              style: context.titleMedium,
                            ),
                          ],
                        ),
                      );
                    }
                    return Text(error.message);
                  },
                  (content) {
                    return NotePaneView(
                      id: widget.selectedItem.id,
                      content: content,
                    );
                  },
                );
              },
            );
          }

          return CustomLoadingIndicator();
        },
      ),
    );
  }
}
