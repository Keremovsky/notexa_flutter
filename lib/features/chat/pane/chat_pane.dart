import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/components/custom_dropdown_button.dart';
import 'package:flutter_mobile/core/extensions/context_extensions.dart';
import 'package:flutter_mobile/features/chat/controller/chat_controller.dart';
import 'package:flutter_mobile/features/chat/models/chat_bubble_model.dart';
import 'package:flutter_mobile/features/chat/state/chat_pane_state.dart';
import 'package:flutter_mobile/features/chat/widget/chat_bubble.dart';
import 'package:flutter_mobile/features/workspace/models/selected_item_model.dart';
import 'package:provider/provider.dart';

class ChatPane extends StatefulWidget {
  final SelectedItem selectedItem;

  const ChatPane({super.key, required this.selectedItem});

  @override
  ChatPaneState createState() => _ChatPaneState();
}

class _ChatPaneState extends ChatPaneState {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          CustomDropdownButtonFormField(
            height: 40,
            width: 140,
            onChanged: onChatModeChanged,
            onSaved: (_) {},
            items: [
              // TODO
              DropdownMenuItem(value: "role", child: Text("Role-play")),
              DropdownMenuItem(value: "chat", child: Text("Chat")),
              DropdownMenuItem(value: "tutor", child: Text("Tutor")),
            ],
          ),
          SizedBox(height: 3),
          SizedBox(
            height: context.screenHeight - 150,
            child: Expanded(
              child: Consumer<ChatController>(
                builder: (context, controller, _) {
                  final messages = controller.chatData.messages;
                  return ListView.builder(
                    controller: scrollController,
                    padding: const EdgeInsets.all(8),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final isUser = ChatType.user == messages[index].type;

                      return Align(
                        alignment: isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: ChatBubbleBox(text: messages[index], isUser: isUser),
                      );
                    },
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
