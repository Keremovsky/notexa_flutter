import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_model.freezed.dart';
part 'document_model.g.dart';

@freezed
abstract class DocumentModel with _$DocumentModel {
  const factory DocumentModel({
    required final int id,
    required final String name,
    required final List<int> notes,
  }) = _DocumentModel;

  factory DocumentModel.fromJson(Map<String, Object?> json) =>
      _$DocumentModelFromJson(json);
}
