import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/components/custom_dropdown_button.dart';
import 'package:flutter_mobile/core/extensions/context_extensions.dart';
import 'package:flutter_mobile/features/chat/state/chat_view_state.dart';
import 'package:flutter_mobile/features/chat/widget/chat_bubble.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends ChatViewState {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomDropdownButtonFormField(
            height: 40,
            width: 140,
            onSaved: onChatModeSaved,
            items: [
              DropdownMenuItem(value: "role", child: Text("Role-play")),
              DropdownMenuItem(value: "chat", child: Text("Chat")),
              DropdownMenuItem(value: "tutor", child: Text("Tutor")),
            ],
            value: currentStringMode,
          ),
          SizedBox(height: 3),
          SizedBox(
            height: context.screenHeight - 150,
            child: Expanded(
              child: ListView.builder(
                controller: scrollController,
                padding: const EdgeInsets.all(8),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[index];
                  final isUser = msg.startsWith("You:");
                  final text = msg.replaceFirst(RegExp(r"^(You|AI): "), "");

                  return Align(
                    alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: ChatBubble(text: text, isUser: isUser),
                  );
                },
              ),
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    onSubmitted: (value) {
                      sendMessage(value);
                      controller.clear();
                    },
                    decoration: const InputDecoration(
                      hintText: "Send a message...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    final text = controller.text.trim();
                    if (text.isNotEmpty) {
                      sendMessage(text);
                      controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
