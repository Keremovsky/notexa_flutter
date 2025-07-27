import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/models/failure_model/failure_model.dart';
import 'package:flutter_mobile/core/services/network/network_service.dart';
import 'package:flutter_mobile/features/chat/models/chat_bubble_model.dart';
import 'package:flutter_mobile/features/chat/models/chat_data_model.dart';
import 'package:fpdart/fpdart.dart';

class ChatController extends ChangeNotifier {
  late NetworkService _networkService;
  late ChatData _chatData;

  ChatData get chatData => _chatData;

  static final ChatController _instance = ChatController._init();
  factory ChatController() => _instance;

  ChatController._init() {
    log("ChatController initialized");

    _networkService = NetworkService();
    _chatData = ChatData(mode: ChatMode.chat);
  }

  ChatData decodeChatData(Map<String, dynamic> data) {
    final messages = data["data"];
    final mode = data["mode"];

    ChatMode chatMode = ChatMode.values.firstWhere((e) => e.name == mode);
    ChatData tempChatData = ChatData(mode: chatMode);
    for (final m in messages) {
      final sender = m["sender"];
      final text = m["text"];

      if (sender == ChatType.ai.name) {
        tempChatData.messages.add(ChatAIBubble(text: text));
      } else if (sender == ChatType.user) {
        tempChatData.messages.add(ChatUserBubble(text: text));
      } else {
        // TODO
      }
    }

    return tempChatData;
  }

  Future<void> loadChatData(int id) async {
    final result = await _networkService.get("/chat/$id");

    result.fold(
      (error) {
        // TODO
        log(error.message);
      },
      (data) {
        _chatData = decodeChatData(data.data!);
        notifyListeners();
      },
    );
  }

  Stream<String> sendPrompt(String prompt) async* {
    final data = {"prompt": prompt};
    final stream = _networkService.sseStream(url: "/chat/stream", data: data);

    chatData.messages.add(ChatUserBubble(text: prompt));

    final newChat = ChatAIBubble(text: "");
    chatData.messages.add(newChat);

    await for (final line in stream) {
      if (line.isLeft()) {
        log(line.getOrElse((error) => "unknown"));
      }

      final result = line.getOrElse((error) => '');

      if (result.startsWith('data: ')) {
        final jsonPart = result.substring(6);
        final decoded = jsonDecode(jsonPart);
        final token = decoded['answer'];

        if (token == '[END]') return;

        newChat.text = "${newChat.text} $token";
        notifyListeners();

        yield token;
      }
    }
  }
}
