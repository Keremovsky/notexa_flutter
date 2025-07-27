import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/constants/colors_constants.dart';
import 'package:flutter_mobile/core/extensions/context_extensions.dart';
import 'package:flutter_mobile/features/chat/models/chat_bubble_model.dart';

class ChatBubbleBox extends StatelessWidget {
  final ChatBubble text;
  final bool isUser;

  const ChatBubbleBox({super.key, required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: context.screenWidth * 0.7),
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isUser ? ColorConstants.chatBubbleColor : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text.text, style: context.displayLarge),
    );
  }
}
