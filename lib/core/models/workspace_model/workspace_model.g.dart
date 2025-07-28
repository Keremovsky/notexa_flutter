// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkspaceModel _$WorkspaceModelFromJson(Map<String, dynamic> json) =>
    _WorkspaceModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      documents: (json['documents'] as List<dynamic>)
          .map((e) => DocumentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkspaceModelToJson(_WorkspaceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'documents': instance.documents,
    };
