part of 'network_service.dart';

abstract interface class INetworkService {
  void setBaseUrl(String baseUrl);
  void setHeaders(Map<NetworkHeaderKeys, String> headers);
  void setHeader(String key, String value);
  void removeHeader(NetworkHeaderKeys key);
  void setToken(String token);
  Stream<Either<FailureModel, String>> sseStream({
    required String url,
    required Map<String, dynamic> data,
  });
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
