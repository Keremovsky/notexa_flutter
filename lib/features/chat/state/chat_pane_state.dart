import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/utils/feedback_util.dart';
import 'package:flutter_mobile/features/chat/controller/chat_controller.dart';
import 'package:flutter_mobile/features/chat/pane/chat_pane.dart';
import 'package:provider/provider.dart';

abstract class ChatPaneState extends State<ChatPane> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<ChatController>().loadChatData(
      widget.selectedItem.id,
      widget.selectedItem.type.name,
      "chat",
    );
  }

  @override
  void didUpdateWidget(covariant ChatPane oldWidget) {
    super.didUpdateWidget(oldWidget);

    context.read<ChatController>().loadChatData(
      widget.selectedItem.id,
      widget.selectedItem.type.name,
      "chat",
    );
  }

  void onChatModeChanged(String? value) async {
    if (value != null) {
      final result = await context.read<ChatController>().loadChatData(
        widget.selectedItem.id,
        widget.selectedItem.type.name,
        value,
      );

      result.fold(() {}, (error) {
        context.read<FeedbackUtil>().showSnackBar(context, error.message);
      });
    }
  }

  void sendMessage(String prompt) {
    context.read<ChatController>().sendPrompt(prompt).listen((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent + 60,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    super.dispose();
  }
}
