import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mobile/core/models/chat_input_model/chat_input_model.dart';
import 'package:flutter_mobile/core/models/failure_model/failure_model.dart';
import 'package:flutter_mobile/core/services/network/network_service.dart';
import 'package:flutter_mobile/features/chat/models/chat_bubble_model.dart';
import 'package:flutter_mobile/features/chat/models/chat_data_model.dart';
import 'package:flutter_mobile/features/workspace/models/selected_item_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class ChatController extends ChangeNotifier {
  late NetworkService _networkService;
  late ChatData _chatData;

  WebSocketChannel? _channel;
  bool _isInitialized = false;
  ChatInputModel? _chatInitInput;
  StreamController<String>? _messageController;

  ChatData get chatData => _chatData;

  static final ChatController _instance = ChatController._init();
  factory ChatController() => _instance;

  ChatController._init() {
    log("ChatController initialized");

    _networkService = NetworkService();
    _chatData = ChatData(mode: ChatMode.chat);
  }

  void initWebSocket(ChatInputModel input) {
    _chatInitInput = input;
    _isInitialized = true;
    _messageController = StreamController<String>.broadcast();

    final uri = Uri.parse("ws://${dotenv.env['baseUrl']!.substring(7)}/chat/stream");

    _channel = WebSocketChannel.connect(uri);

    _channel!.sink.add(jsonEncode(input.toJson()));

    _channel!.stream.listen(
      (message) {
        _messageController?.add(message);
      },
      onError: (error) {
        _messageController?.addError(error);
      },
      onDone: () {
        _messageController?.close();
      },
    );
  }

  Stream<String> sendPrompt(String prompt) {
    if (_channel == null || !_isInitialized || _chatInitInput == null) {
      throw Exception("WebSocket not initialized. Call initWebSocket first.");
    }

    chatData.messages.add(ChatUserBubble(text: prompt));
    final aiBubble = ChatAIBubble(text: "");
    chatData.messages.add(aiBubble);
    notifyListeners();

    _channel!.sink.add(prompt);

    return _messageController!.stream.map((token) {
      aiBubble.text += token;
      notifyListeners();
      return token;
    });
  }

  Future<void> closeWebSocket() async {
    if (_channel != null) {
      await _channel!.sink.close(status.normalClosure);
      _messageController?.close();
      _channel = null;
      _messageController = null;
      _chatInitInput = null;
      _isInitialized = false;
    }
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

  Future<Option<FailureModel>> loadChatData(
    int id,
    String type,
    String mode, {
    String? feynman,
  }) async {
    if (type == SelectedItemType.none.name) return none();

    await closeWebSocket();
    initWebSocket(
      ChatInputModel(id: id, prompt: "", tp: type, mode: mode, feynman: feynman),
    );

    final url = feynman != null
        ? "/chat/$id?tp=$type&mode=$mode&feynman_level=$feynman"
        : "/chat/$id?tp=$type&mode=$mode";
    final result = await _networkService.get(url);

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

  Future<Option<FailureModel>> clearChat(
    int id,
    String type,
    String mode, {
    String? feynman,
  }) async {
    if (type == SelectedItemType.none.name) return none();

    final url = feynman != null
        ? "/chat/clear/$id?tp=$type&mode=$mode&feynman_level=$feynman"
        : "/chat/clear/$id?tp=$type&mode=$mode";
    final result = await _networkService.delete(url);

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
