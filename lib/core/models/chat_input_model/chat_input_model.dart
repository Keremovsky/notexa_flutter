import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_input_model.freezed.dart';
part 'chat_input_model.g.dart';

@freezed
abstract class ChatInputModel with _$ChatInputModel {
  const factory ChatInputModel({
    required final int id,
    required final String prompt,
    required final String tp,
    required final String mode,
  }) = _ChatInputModel;

  factory ChatInputModel.fromJson(Map<String, Object?> json) =>
      _$ChatInputModelFromJson(json);
}
