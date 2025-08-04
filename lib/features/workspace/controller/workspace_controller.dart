import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/models/document_model/document_model.dart';
import 'package:flutter_mobile/core/models/failure_model/failure_model.dart';
import 'package:flutter_mobile/core/models/note_model/note_model.dart';
import 'package:flutter_mobile/core/models/workspace_list_model/workspace_list_item_model.dart';
import 'package:flutter_mobile/core/models/workspace_model/workspace_model.dart';
import 'package:flutter_mobile/core/services/network/network_service.dart';
import 'package:fpdart/fpdart.dart';

class WorkspaceController extends ChangeNotifier {
  late NetworkService _networkService;
  late WorkspaceModel _workspace;

  WorkspaceModel get workspace => _workspace;

  static final WorkspaceController _instance = WorkspaceController._init();
  factory WorkspaceController() => _instance;

  WorkspaceController._init() {
    log("WorkspaceController initialized");

    _networkService = NetworkService();
  }

  // WORKSPACE

  Future<Option<FailureModel>> createWorkspace(String name) async {
    final result = await _networkService.post("/workspace", data: {"name": name});

    return result.fold(
      (error) {
        return some(error);
      },
      (result) {
        return none();
      },
    );
  }

  Future<Option<FailureModel>> getWorkspace(int id, String name) async {
    final result = await _networkService.get("/workspace/$id");

    return result.fold(
      (error) {
        log(error.message);
        return some(error);
      },
      (result) {
        final data = result.data;
        if (data is Map<String, dynamic>) {
          List<DocumentModel> tempDocs = [];

          final docs = data["docs"];

          for (final doc in docs) {
            List<NoteModel> tempNotes = [];

            final notes = doc["notes"] ?? [];

            for (final note in notes) {
              tempNotes.add(NoteModel.fromJson(note));
            }
            tempDocs.add(
              DocumentModel(id: doc["id"], name: doc["name"], notes: tempNotes),
            );
          }
          _workspace = WorkspaceModel(id: id, name: name, documents: tempDocs);
          notifyListeners();
          return none();
        }

        return some(FailureModel.fail("Type of fetched data was wrong."));
      },
    );
  }

  Future<Option<FailureModel>> removeWorkspace(int id) async {
    final result = await _networkService.delete("/workspace/$id");

    return result.fold(
      (error) {
        return some(error);
      },
      (result) {
        return none();
      },
    );
  }

  Future<Either<FailureModel, List<WorkspaceListItemModel>>> getWorkspaces() async {
    final result = await _networkService.get("/workspace/all");

    return result.fold(
      (error) {
        //TODO
        return Left(error);
      },
      (result) {
        final data = result.data;

        if (data is Map<String, dynamic>) {
          final List<WorkspaceListItemModel> temp = [];
          for (final workspace in data["workspaces"]) {
            temp.add(WorkspaceListItemModel.fromJson(workspace));
          }
          return Right(temp);
        }

        return Left(FailureModel.fail("Type of fetched data was wrong."));
      },
    );
  }

  // DOCUMENT

  Future<Option<FailureModel>> uploadFileToWorkspace(int workspaceId) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.path != null) {
      String filePath = result.files.single.path!;
      File file = File(filePath);
      String fileName = file.path.split('/').last;

      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          filePath,
          filename: fileName,
          contentType: DioMediaType('application', 'pdf'),
        ),
      });

      try {
        _networkService.setHeader("Content-Type", "multipart/form-data");

        final result = await _networkService.post(
          "/workspace/documents/upload/$workspaceId",
          data: formData,
        );

        _networkService.removeHeader("Content-Type");

        return result.fold(
          (error) {
            log(error.message);
            return some(error);
          },
          (_) async {
            log("Uploading pdf file is successful");
            await getWorkspace(_workspace.id, _workspace.name);
            return none();
          },
        );
      } catch (e) {
        log("Error: ${e.toString()}");
        return some(FailureModel.fail(e.toString()));
      }
    } else {
      log("File is not selected");
      // TODO
      return some(FailureModel.fail("File not selected"));
    }
  }

  Future<Either<FailureModel, List<int>>> getFileFromWorkspace(int id) async {
    final result = await _networkService.getFile("/workspace/documents/$id/file");

    return result.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(data);
      },
    );
  }

  Future<Option<FailureModel>> removeDocumentFromWorkspace(int docId) async {
    final result = await _networkService.delete("/workspace/documents/$docId");

    return result.fold(
      (error) {
        return some(error);
      },
      (result) {
        _workspace = _workspace.copyWith(
          documents: _workspace.documents.where((doc) => doc.id != docId).toList(),
        );
        notifyListeners();

        return none();
      },
    );
  }

  // NOTE

  Future<Either<FailureModel, String>> getNoteFromWorkspace(int id) async {
    final result = await _networkService.get("/workspace/notes/$id");

    return result.fold(
      (error) {
        return Left(error);
      },
      (result) {
        final data = result.data;

        if (data is Map<String, dynamic>) {
          return Right(data["content"]);
        }

        return Left(FailureModel.fail("Type of fetched data was wrong."));
      },
    );
  }

  Future<Option<FailureModel>> addNoteToWorkspace(String title, int id) async {
    final result = await _networkService.post(
      "/workspace/notes",
      data: {"title": title, "doc": id},
    );

    return result.fold(
      (error) {
        return some(error);
      },
      (result) async {
        await getWorkspace(_workspace.id, _workspace.name);
        return none();
      },
    );
  }

  Future<Option<FailureModel>> removeNoteFromWorkspace(int id) async {
    final result = await _networkService.delete("/workspace/notes/$id");

    return result.fold(
      (error) {
        return some(error);
      },
      (result) {
        final documents = _workspace.documents.map((doc) {
          final notes = doc.notes.where((note) => note.id != id).toList();
          return doc.copyWith(notes: notes);
        }).toList();
        _workspace = _workspace.copyWith(documents: documents);
        notifyListeners();
        return none();
      },
    );
  }

  Future<Option<FailureModel>> updateNoteContent(int id, String content) async {
    final result = await _networkService.put(
      "/workspace/notes/$id",
      data: {"content": content},
    );

    return result.fold(
      (error) {
        return some(error);
      },
      (result) {
        return none();
      },
    );
  }
}
