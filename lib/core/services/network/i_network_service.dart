part of 'network_service.dart';

abstract interface class INetworkService {
  void setBaseUrl(String baseUrl);
  void setHeaders(Map<NetworkHeaderKeys, String> headers);
  void setHeader(String key, String value);
  void removeHeader(NetworkHeaderKeys key);
  void setToken(String token);
  void removeToken();
  Future<Either<FailureModel, Response<dynamic>>> get(String url);
  Future<Either<FailureModel, Response<dynamic>>> post(
    String url, {
    required dynamic data,
  });
  Future<Either<FailureModel, Response<dynamic>>> delete(String url);
  Future<Either<FailureModel, Response<dynamic>>> put(
    String url, {
    required dynamic data,
  });
}
