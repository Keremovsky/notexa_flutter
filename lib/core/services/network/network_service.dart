import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mobile/core/constants/network_constants.dart';
import 'package:flutter_mobile/core/enums/network_keys_enum.dart';
import 'package:flutter_mobile/core/extensions/network_extensions.dart';
import 'package:flutter_mobile/core/models/failure_model/failure_model.dart';
import 'package:flutter_mobile/core/services/connectivity/connectivity_service.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

part 'i_network_service.dart';

class NetworkService implements INetworkService {
  late Dio _dio;
  late ConnectivityService _connectivityService;

  factory NetworkService() => _instance;
  static final NetworkService _instance = NetworkService._init();

  NetworkService._init() {
    _dio = Dio();
    _connectivityService = ConnectivityService();

    setBaseUrl(dotenv.env['baseUrl']!);
    setHeader("Content-Type", "application/json");
    log("NetworkService initialized");
  }

  @override
  void setBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }

  Stream<Either<FailureModel, String>> sseStream({
    required String url,
    required Map<String, dynamic> data,
  }) async* {
    try {
      if (!await _connectivityService.isConnected) {
        // TODO
        yield Left(FailureModel.fail("No internet connection"));
      }

      final response = await _dio.post<ResponseBody>(
        url,
        data: data,
        options: Options(
          headers: {'Accept': 'text/event-stream'},
          responseType: ResponseType.stream,
        ),
      );

      final stream = response.data!.stream
          .transform(StreamTransformer.fromBind(utf8.decoder.bind))
          .transform(const LineSplitter());

      await for (final line in stream) {
        yield Right(line);
      }
    } catch (e, stackTrace) {
      log("SSE Error: $e\n$stackTrace");
      // TODO
      yield Left(FailureModel.fail("message"));
    }
  }

  @override
  void setHeaders(Map<NetworkHeaderKeys, String> headers) {
    headers.forEach((key, value) {
      _dio.options.headers[key.name] = value;
    });
  }

  @override
  void setHeader(String key, String value) {
    _dio.options.headers[key] = value;
  }

  @override
  void removeHeader(NetworkHeaderKeys key) {
    _dio.options.headers.remove(key.name);
  }

  @override
  void setToken(String token) {
    _dio.options.headers[NetworkConstants.authorization] = token;
  }

  @override
  void removeToken() {
    _dio.options.headers.remove(NetworkConstants.authorization);
  }

  @override
  Future<Either<FailureModel, Response<Map<String, dynamic>>>> get(
    String url,
  ) async {
    return await _doRequest(() => _dio.get(url));
  }

  @override
  Future<Either<FailureModel, Response<Map<String, dynamic>>>> post(
    String url, {
    required dynamic data,
  }) async {
    return await _doRequest(() => _dio.post(url, data: data));
  }

  @override
  Future<Either<FailureModel, Response<Map<String, dynamic>>>> delete(
    String url,
  ) async {
    return await _doRequest(() => _dio.delete(url));
  }

  @override
  Future<Either<FailureModel, Response<Map<String, dynamic>>>> put(
    String url, {
    required dynamic data,
  }) async {
    return await _doRequest(() => _dio.put(url, data: data));
  }

  Future<Either<FailureModel, Response<Map<String, dynamic>>>> _doRequest(
    AsyncValueGetter<Response<Map<String, dynamic>>> operation,
  ) async {
    try {
      if (await _connectivityService.isConnected) {
        final result = await operation();

        if (!result.isSuccess) {
          log(result.data.toString());
          return Left(FailureModel.fail(result.data?["message"] as String? ?? ""));
        }

        return Right(result);
      } else {
        return const Left(FailureModel.fail("No connection."));
      }
    } on TimeoutException {
      return const Left(FailureModel.fail("Connection is timed out."));
    } on DioException catch (e) {
      log(e.message ?? "");
      return Left(
        FailureModel.fail("An error occurred while fetching data from server."),
      );
    } catch (e) {
      log(e.toString());
      return Left(FailureModel.fail(e.toString()));
    }
  }
}
