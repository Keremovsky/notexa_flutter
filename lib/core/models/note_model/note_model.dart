import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_model.freezed.dart';
part 'note_model.g.dart';

@freezed
abstract class NoteModel with _$NoteModel {
  const factory NoteModel({required final int id, required final String title}) =
      _NoteModel;

  factory NoteModel.fromJson(Map<String, Object?> json) => _$NoteModelFromJson(json);
}
