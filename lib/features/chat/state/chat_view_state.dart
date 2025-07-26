import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobile/features/chat/controller/chat_controller.dart';
import 'package:flutter_mobile/features/chat/view/chat_view.dart';
import 'package:provider/provider.dart';

abstract class ChatViewState extends State<ChatView> {
  final List<String> messages = [];
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();
  StreamSubscription? _streamSub;
  String currentStringMode = "chat";

  void onChatModeSaved(String? value) {
    if (value != null) {
      setState(() {
        currentStringMode = value;
      });
    }
  }

  void sendMessage(String prompt) {
    messages.add("You: $prompt");
    setState(() {});

    _streamSub?.cancel();
    _streamSub = context
        .read<ChatController>()
        .sendPrompt(data: {"prompt": prompt})
        .listen((result) {
          result.match(
            (failure) {
              messages.add("Error: ${failure.message}");
              setState(() {});
            },
            (token) {
              if (messages.last.startsWith("AI:")) {
                messages[messages.length - 1] += token;
              } else {
                messages.add("AI: $token");
              }
              setState(() {});
              scrollController.animateTo(
                scrollController.position.maxScrollExtent + 60,
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOut,
              );
            },
          );
        });
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    _streamSub?.cancel();
    super.dispose();
  }
}
