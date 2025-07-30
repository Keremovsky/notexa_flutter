part of 'network_service.dart';

abstract interface class INetworkService {
  Stream<Either<FailureModel, String>> sseStream({
    required String url,
    required Map<String, dynamic> data,
  });
  Future<Either<FailureModel, List<int>>> getFile(String url);
  void setBaseUrl(String baseUrl);
  void setHeaders(Map<String, String> headers);
  void setHeader(String key, String value);
  void removeHeader(String key);
  void setToken(String token);
  void removeToken();
  Future<Either<FailureModel, Response<Map<String, dynamic>>>> get(String url);
  Future<Either<FailureModel, Response<Map<String, dynamic>>>> post(
    String url, {
    required dynamic data,
  });
  Future<Either<FailureModel, Response<Map<String, dynamic>>>> delete(String url);
  Future<Either<FailureModel, Response<Map<String, dynamic>>>> put(
    String url, {
    required dynamic data,
  });
}
