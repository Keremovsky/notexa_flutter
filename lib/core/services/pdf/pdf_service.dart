import 'dart:io';

import 'package:flutter_mobile/core/models/failure_model/failure_model.dart';
import 'package:fpdart/src/option.dart';
import 'package:path_provider/path_provider.dart';

part "i_pdf_service.dart";

class PdfService implements IPdfService {
  final String _pdfCacheDir = "pdf_cache";

  @override
  Future<File?> getPdfFromCache(String filename) async {
    final dir = await getApplicationSupportDirectory();
    final file = File("${dir.path}/$_pdfCacheDir/$filename");

    final isFileExist = await file.exists();

    if (isFileExist) {
      return file;
    }

    return null;
  }

  @override
  Future<Option<FailureModel>> savePdfToCache(
    String filename,
    List<int> bytes,
  ) async {
    final dir = await getApplicationSupportDirectory();

    final cacheDirPath = "${dir.path}/$_pdfCacheDir";
    final cacheDir = Directory(cacheDirPath);

    if (!await cacheDir.exists()) {
      await cacheDir.create(recursive: true);
    }

    final file = File("$cacheDirPath/$filename");

    final savedFile = await file.writeAsBytes(bytes);

    final isFileExist = await savedFile.exists();

    if (isFileExist) {
      return none();
    }
    return some(FailureModel.fail("File doesn't exist."));
  }

  @override
  Future<Option<FailureModel>> removePdfFromCache(String filename) async {
    final dir = await getApplicationSupportDirectory();
    final file = File("${dir.path}/$_pdfCacheDir/$filename");

    final isFileExist = await file.exists();

    if (isFileExist) {
      final removedFile = await file.delete();

      final isRemoved = await removedFile.exists();

      if (!isRemoved) return none();
      return some(FailureModel.fail(""));
    }
    return some(FailureModel.fail("File doesn't exist."));
  }
}
