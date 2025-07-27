import 'package:flutter/material.dart';
import 'package:flutter_mobile/features/chat/controller/chat_controller.dart';
import 'package:flutter_mobile/features/chat/view/chat_view.dart';
import 'package:provider/provider.dart';

abstract class ChatViewState extends State<ChatView> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  void onChatModeChanged(String? value) {
    if (value != null) {
      // TODO
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
