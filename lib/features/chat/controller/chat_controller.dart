import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/models/failure_model/failure_model.dart';
import 'package:flutter_mobile/core/services/network/network_service.dart';
import 'package:flutter_mobile/features/chat/models/chat_data_model.dart';
import 'package:fpdart/fpdart.dart';

class ChatController extends ChangeNotifier {
  late NetworkService _networkService;
  late ChatData chatData;

  static final ChatController _instance = ChatController._init();
  factory ChatController() => _instance;

  ChatController._init() {
    log("ChatController initialized");

    _networkService = NetworkService();
  }

  ChatData decodeChatData(Response<dynamic> data) {
    // TODO
    return ChatData(mode: ChatMode.chat);
  }

  Future<void> getChatData() async {
    final result = await _networkService.get("/chat");

    result.fold((error) {}, (data) {
      notifyListeners();
    });
  }

  Stream<Either<FailureModel, String>> sendPrompt({
    required Map<String, dynamic> data,
  }) {
    final stream = _networkService.sseStream(url: "/chat/stream", data: data);
    return stream;
  }
}
