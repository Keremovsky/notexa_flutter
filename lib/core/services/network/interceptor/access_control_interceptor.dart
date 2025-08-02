import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mobile/core/services/secure_storage/secure_storage_service.dart';
import 'package:flutter_mobile/features/auth/controller/auth_controller.dart';
import 'package:flutter_mobile/router/router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AccessControlInterceptor extends Interceptor {
  final Dio _dio;
  late SecureStorageService _secureStorageService;
  late AppRouter _router;

  AccessControlInterceptor({required Dio dio}) : _dio = dio {
    _router = AppRouter();
    _secureStorageService = SecureStorageService();
  }

  bool _isRefreshing = false;
  final _retryQueue = <RequestOptions>[];
  final List<String> _protectedPathList = ["/workspace", "/chat"];

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (!_protectedPathList.any((endpoint) => options.path.contains(endpoint))) {
      return handler.next(options);
    }

    final accessToken = await _secureStorageService.get(dotenv.env["accessToken"]!);

    if (JwtDecoder.isExpired(accessToken!)) {
      if (!_isRefreshing) {
        _isRefreshing = true;
        _retryQueue.add(options);

        try {
          final result = await AuthController().refreshAuth(
            dotenv.env["refreshToken"]!,
          );

          result.fold(
            () async {
              for (final req in _retryQueue) {
                await _dio.fetch(req);
              }
              _retryQueue.clear();
            },
            (error) {
              log(error.message);

              _router.replaceAll([LoginViewRoute()]);

              return handler.reject(
                DioException(
                  requestOptions: options,
                  type: DioExceptionType.cancel,
                  error: 'Unauthenticated',
                ),
              );
            },
          );
        } catch (e) {
          _retryQueue.clear();

          _router.replaceAll([LoginViewRoute()]);

          return handler.reject(
            DioException(
              requestOptions: options,
              type: DioExceptionType.cancel,
              error: 'Unauthenticated',
            ),
          );
        } finally {
          _isRefreshing = false;
        }
      }

      _retryQueue.add(options);
    } else {
      return handler.next(options);
    }
  }
}
