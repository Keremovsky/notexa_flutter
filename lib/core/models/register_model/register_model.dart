import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_model.freezed.dart';
part 'register_model.g.dart';

@freezed
abstract class RegisterModel with _$RegisterModel {
  const factory RegisterModel({
    required final String email,
    required final String username,
    required final String password,
  }) = _RegisterModel;

  factory RegisterModel.fromJson(Map<String, Object?> json) =>
      _$RegisterModelFromJson(json);
}
