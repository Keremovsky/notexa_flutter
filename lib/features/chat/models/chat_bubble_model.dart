enum ChatType { user, ai }

class ChatBubble {
  String text;
  final ChatType type;

  ChatBubble({required this.text, required this.type});
}

class ChatAIBubble extends ChatBubble {
  ChatAIBubble({required super.text, super.type = ChatType.ai});
}

class ChatUserBubble extends ChatBubble {
  ChatUserBubble({required super.text, super.type = ChatType.user});
}
