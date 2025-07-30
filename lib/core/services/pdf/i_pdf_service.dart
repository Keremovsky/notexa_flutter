part of "pdf_service.dart";

abstract interface class IPdfService {
  Future<File?> getPdfFromCache(String filename);

  Future<Option<FailureModel>> savePdfToCache(String filename, List<int> bytes);

  Future<Option<FailureModel>> removePdfFromCache(String filename);
}
