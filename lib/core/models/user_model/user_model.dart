import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required final String access,
    required final String refresh,
    required final String username,
    required final String email,
  }) = _UserModel;

  factory UserModel.empty() =>
      const UserModel(access: "", refresh: "", username: "", email: "");

  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);
}
