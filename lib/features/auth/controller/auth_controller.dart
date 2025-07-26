import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mobile/core/models/login_model/login_model.dart';
import 'package:flutter_mobile/core/models/register_model/register_model.dart';
import 'package:flutter_mobile/core/models/user_model/user_model.dart';
import 'package:flutter_mobile/core/models/failure_model/failure_model.dart';
import 'package:flutter_mobile/core/services/network/network_service.dart';
import 'package:flutter_mobile/core/services/secure_storage/secure_storage_service.dart';
import 'package:fpdart/fpdart.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthController extends ChangeNotifier {
  late NetworkService _networkService;
  late SecureStorageService _secureStorageService;
  late UserModel _user;

  UserModel get user => _user;

  static final AuthController _instance = AuthController._init();
  factory AuthController() => _instance;

  AuthController._init() {
    log("AuthController initialized");

    _networkService = NetworkService();
    _secureStorageService = SecureStorageService();
  }

  Future<Option<FailureModel>> login(LoginModel data) async {
    final result = await _networkService.post("/users/login", data: data.toJson());

    return await result.fold(
      (error) {
        return some(error);
      },
      (result) async {
        final data = result.data;
        if (data is Map<String, dynamic>) {
          final userData = UserModel.fromJson(data);

          await _secureStorageService.store(
            dotenv.env['refreshToken']!,
            userData.refresh,
          );
          await _secureStorageService.store(
            dotenv.env['accessToken']!,
            userData.access,
          );

          _networkService.setToken("Bearer ${userData.access}");

          _user = userData;
          print(_user);
          notifyListeners();

          return none();
        }

        return some(FailureModel.fail("Type of fetched data was wrong."));
      },
    );
  }

  // TODO: come back and decide and implement auto login
  Future<Option<FailureModel>> autoLogin() async {
    final refreshToken = await _secureStorageService.get(
      dotenv.env['refreshToken']!,
    );

    if (refreshToken == null) {
      return some(FailureModel.fail(""));
    }

    final isExpired = JwtDecoder.isExpired(refreshToken);

    if (isExpired) {
      return some(FailureModel.fail(""));
    }

    return await refreshAuth(refreshToken);
  }

  Future<Option<FailureModel>> register(RegisterModel data) async {
    final result = await _networkService.post(
      "/users/register",
      data: data.toJson(),
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

  Future<Option<FailureModel>> exitFromAccount() async {
    try {
      await _secureStorageService.remove(dotenv.env['refreshToken']!);
      await _secureStorageService.remove(dotenv.env['accessToken']!);
      _user = UserModel.empty();
      return none();
    } catch (e) {
      return some(FailureModel.fail("An error occurred while exiting."));
    }
  }

  Future<Option<FailureModel>> refreshAuth(String refreshToken) async {
    final result = await _networkService.post(
      "/users/refresh",
      data: {"refresh_token": refreshToken},
    );

    return await result.fold(
      (error) {
        return some(error);
      },
      (result) async {
        final data = result.data;
        if (data is Map<String, dynamic>) {
          final accessToken = data["access_token"];

          final userData = UserModel.fromJson({"accessToken": accessToken});

          _networkService.setToken("Bearer $accessToken");

          await _secureStorageService.store(dotenv.env['accessToken']!, accessToken);

          _user = userData;
          notifyListeners();

          return none();
        }
        return some(FailureModel.fail("Type of fetched data was wrong."));
      },
    );
  }
}
