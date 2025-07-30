import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/extensions/context_extensions.dart';
import 'package:flutter_mobile/features/workspace/models/selected_item_model.dart';
import 'package:flutter_mobile/features/workspace/state/content_pane_state.dart';
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
        future: future,
        builder: (context, snapshot) {
          final data = snapshot.data;

          if (data == null) {
            // TODO
            print("WHHYYY NULLL");
            return SizedBox();
          }

          return data.fold(
            (file) {
              return SfPdfViewer.file(file);
            },
            (right) {
              return right.fold(
                (error) {
                  if (error.message.isEmpty) {
                    // TODO
                    return Text("Please select a note or document :)");
                  }
                  return Text(error.message);
                },
                (content) {
                  // TODO
                  return Text(content, style: context.displayLarge);
                },
              );
            },
          );
        },
      ),
    );
  }
}
