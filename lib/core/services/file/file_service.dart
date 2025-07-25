import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';

import 'package:path_provider/path_provider.dart';

part 'i_file_service.dart';

class FileService implements IFileService {
  factory FileService() => _instance;
  static final FileService _instance = FileService._init();

  FileService._init() {
    dev.log("FileService is Initialized");
  }

  @override
  Future<File> generateTempFile(String fileExtension) async {
    final Directory tempDirectory = await getApplicationCacheDirectory();

    final String randomTempFileName = _generateTempFileName();

    File file = File('${tempDirectory.path}/$randomTempFileName.$fileExtension');

    return file;
  }

  @override
  void removeTempFile(File? file) {
    if (file == null) return;

    if (file.existsSync()) {
      file.deleteSync();
      dev.log("file removed: ${file.path}");
    }
  }

  String _generateTempFileName() {
    int randomNum = Random().nextInt(10000);
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    return "temp_${timestamp}_$randomNum";
  }
}
