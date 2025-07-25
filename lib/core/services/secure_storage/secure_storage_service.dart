import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'i_secure_storage_service.dart';

class SecureStorageService implements ISecureStorageService {
  late FlutterSecureStorage _secureStorage;

  factory SecureStorageService() => _instance;
  static final SecureStorageService _instance = SecureStorageService._init();

  SecureStorageService._init() {
    _secureStorage = FlutterSecureStorage();
    log("SecureStorageService is Initialized");
  }

  @override
  Future<void> store(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  @override
  Future<String?> get(String key) async {
    return await _secureStorage.read(key: key);
  }

  @override
  Future<void> remove(String key) async {
    await _secureStorage.delete(key: key);
  }
}
