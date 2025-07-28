import 'package:flutter_mobile/core/models/document_model/document_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workspace_model.freezed.dart';
part 'workspace_model.g.dart';

@freezed
abstract class WorkspaceModel with _$WorkspaceModel {
  const factory WorkspaceModel({
    required final int id,
    required final String name,
    required final List<DocumentModel> documents,
  }) = _WorkspaceModel;

  factory WorkspaceModel.fromJson(Map<String, Object?> json) =>
      _$WorkspaceModelFromJson(json);
}
