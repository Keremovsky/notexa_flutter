part of 'file_service.dart';

abstract interface class IFileService {
  Future<File> generateTempFile(String fileExtension);

  void removeTempFile(File file);
}
