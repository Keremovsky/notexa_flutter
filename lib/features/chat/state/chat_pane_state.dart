import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/models/chat_input_model/chat_input_model.dart';
import 'package:flutter_mobile/core/utils/feedback_util.dart';
import 'package:flutter_mobile/features/chat/controller/chat_controller.dart';
import 'package:flutter_mobile/features/chat/pane/chat_pane.dart';
import 'package:provider/provider.dart';

abstract class ChatPaneState extends State<ChatPane> {
  String chatMode = "chat";

  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<ChatController>().loadChatData(
      widget.selectedItem.id,
      widget.selectedItem.type.name,
      chatMode,
    );
  }

  @override
  void didUpdateWidget(covariant ChatPane oldWidget) {
    super.didUpdateWidget(oldWidget);

    context.read<ChatController>().loadChatData(
      widget.selectedItem.id,
      widget.selectedItem.type.name,
      chatMode,
    );

    scrollController.animateTo(
      scrollController.position.maxScrollExtent + 60,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void onChatModeChanged(String? value) async {
    if (value != null && value != chatMode) {
      final result = await context.read<ChatController>().loadChatData(
        widget.selectedItem.id,
        widget.selectedItem.type.name,
        value,
      );

      result.fold(
        () {
          setState(() {
            chatMode = value;
          });

          if (scrollController.hasClients) {
            scrollController.jumpTo(scrollController.position.maxScrollExtent);
          }
        },
        (error) {
          context.read<FeedbackUtil>().showSnackBar(context, error.message);
        },
      );
    }
  }

  void sendMessage(String prompt) {
    final ChatInputModel input = ChatInputModel(
      id: widget.selectedItem.id,
      prompt: prompt,
      tp: widget.selectedItem.type.name,
      mode: chatMode,
    );

    context.read<ChatController>().sendPrompt(input).listen((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent + 60,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    });
  }
}
