import 'package:flutter_mobile/features/chat/models/chat_bubble_model.dart';

enum ChatMode { chat, role, feynman, debate, cases, reflect, editor }

class ChatData {
  List<ChatBubble> messages;
  final ChatMode mode;
  late int id;

  ChatData({required this.mode, List<ChatBubble> messages = const []})
    : messages = List<ChatBubble>.from(messages);
}
