import 'package:freezed_annotation/freezed_annotation.dart';

part 'workspace_list_item_model.freezed.dart';
part 'workspace_list_item_model.g.dart';

@freezed
abstract class WorkspaceListItemModel with _$WorkspaceListItemModel {
  const factory WorkspaceListItemModel({
    required final int id,
    required final String name,
  }) = _WorkspaceListItemModel;

  factory WorkspaceListItemModel.fromJson(Map<String, Object?> json) =>
      _$WorkspaceListItemModelFromJson(json);
}
