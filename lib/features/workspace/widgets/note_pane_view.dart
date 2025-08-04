import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/extensions/context_extensions.dart';
import 'package:flutter_mobile/features/workspace/controller/workspace_controller.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:provider/provider.dart';

class NotePaneView extends StatefulWidget {
  final int id;
  final String content;

  const NotePaneView({super.key, required this.id, required this.content});

  @override
  _NotePaneViewState createState() => _NotePaneViewState();
}

class _NotePaneViewState extends State<NotePaneView> {
  late quill.QuillController quillController;
  final TextEditingController _controller = TextEditingController();

  Timer? _debounce;

  @override
  void initState() {
    super.initState();

    quillController = quill.QuillController(
      document: quill.Document()..insert(0, widget.content),
      selection: const TextSelection.collapsed(offset: 0),
    );

    quillController.document.changes.listen((event) {
      _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 500), () {
        final plainText = quillController.document.toPlainText().trim();
        debugPrint('Debounced content:\n$plainText');
        context.read<WorkspaceController>().updateNoteContent(widget.id, plainText);
      });
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    quillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: quill.QuillEditor.basic(
          controller: quillController,
          config: quill.QuillEditorConfig(
            customStyles: quill.DefaultStyles(
              paragraph: quill.DefaultTextBlockStyle(
                context.displayLarge!,
                quill.HorizontalSpacing(0, 0),
                quill.VerticalSpacing(0, 0),
                quill.VerticalSpacing(0, 0),
                null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
