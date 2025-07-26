import 'package:flutter_mobile/features/chat/widget/chat_bubble.dart';

enum ChatMode { chat, role, tutor }

class ChatData {
  List<ChatBubble> messages;
  final ChatMode mode;
  late int id;

  ChatData({required this.mode, this.messages = const <ChatBubble>[]});
}
