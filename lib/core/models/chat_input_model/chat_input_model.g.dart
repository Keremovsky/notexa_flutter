// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatInputModel _$ChatInputModelFromJson(Map<String, dynamic> json) =>
    _ChatInputModel(
      id: (json['id'] as num).toInt(),
      prompt: json['prompt'] as String,
      tp: json['tp'] as String,
      mode: json['mode'] as String,
      feynman: json['feynman'] as String?,
    );

Map<String, dynamic> _$ChatInputModelToJson(_ChatInputModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prompt': instance.prompt,
      'tp': instance.tp,
      'mode': instance.mode,
      'feynman': instance.feynman,
    };
