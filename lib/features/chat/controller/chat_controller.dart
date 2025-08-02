import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/models/chat_input_model/chat_input_model.dart';
import 'package:flutter_mobile/core/models/failure_model/failure_model.dart';
import 'package:flutter_mobile/core/services/network/network_service.dart';
import 'package:flutter_mobile/features/chat/models/chat_bubble_model.dart';
import 'package:flutter_mobile/features/chat/models/chat_data_model.dart';
import 'package:flutter_mobile/features/workspace/models/selected_item_model.dart';
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

  ChatData decodeChatData(Map<String, dynamic> data, String mode) {
    final messages = data["messages"];

    ChatMode chatMode = ChatMode.values.firstWhere((e) => e.name == mode);
    ChatData tempChatData = ChatData(mode: chatMode);
    for (final m in messages) {
      final sender = m["sender"];
      final text = m["text"];

      if (sender == ChatType.ai.name) {
        tempChatData.messages.add(ChatAIBubble(text: text));
      } else if (sender == ChatType.user.name) {
        tempChatData.messages.add(ChatUserBubble(text: text));
      } else {
        // TODO
      }
    }

    return tempChatData;
  }

  Future<Option<FailureModel>> loadChatData(int id, String type, String mode) async {
    if (type == SelectedItemType.none.name) return none();

    final result = await _networkService.get("/chat/$id?tp=$type&mode=$mode");

    return result.fold(
      (error) {
        log(error.message);
        return some(error);
      },
      (result) {
        final data = result.data;

        if (data is Map<String, dynamic>) {
          _chatData = decodeChatData(result.data!, mode);
          notifyListeners();
          return none();
        }

        return some(FailureModel.fail("Type of fetched data was wrong."));
      },
    );
  }

  Stream<String> sendPrompt(ChatInputModel chatInput) async* {
    chatData.messages.add(ChatUserBubble(text: chatInput.prompt));
    notifyListeners();

    final stream = _networkService.sseStream(
      url: "/chat/stream",
      data: chatInput.toJson(),
    );

    final newChat = ChatAIBubble(text: "");
    chatData.messages.add(newChat);

    await for (final line in stream) {
      if (line.isLeft()) {
        log(line.getOrElse((error) => "unknown"));
        chatData.messages.removeRange(
          chatData.messages.length - 2,
          chatData.messages.length,
        );
        notifyListeners();
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

  Future<Option<FailureModel>> clearChat(int id, String type, String mode) async {
    if (type == SelectedItemType.none.name) return none();

    final result = await _networkService.delete(
      "/chat/clear/$id?tp=$type&mode=$mode",
    );

    return result.fold(
      (error) {
        log(error.message);
        return some(error);
      },
      (result) {
        final data = result.data;

        if (data is Map<String, dynamic>) {
          _chatData = ChatData(mode: _chatData.mode);
          notifyListeners();
          return none();
        }

        return some(FailureModel.fail("Type of fetched data was wrong."));
      },
    );
  }
}
