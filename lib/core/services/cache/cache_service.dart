import 'dart:developer';

import 'package:flutter_mobile/core/enums/cache_keys_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'i_cache_service.dart';

class CacheService implements ICacheService {
  late SharedPreferences _preferences;

  factory CacheService() => _instance;
  static final CacheService _instance = CacheService._init();

  CacheService._init() {
    log("CacheService is Initialized");
  }

  Future<void> ensureInitialized() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  void set<T extends Object>(CacheKeys key, T value) {
    switch (T) {
      case const (String):
        _preferences.setString(key.name, value as String);
        break;
      case const (int):
        _preferences.setInt(key.name, value as int);
        break;
      case const (double):
        _preferences.setDouble(key.name, value as double);
        break;
      case const (bool):
        _preferences.setBool(key.name, value as bool);
        break;
      default:
        throw Exception("Type is not supported");
    }
  }

  @override
  T? get<T extends Object>(CacheKeys key) {
    switch (T) {
      case const (String):
        return _preferences.getString(key.name) as T?;
      case const (int):
        return _preferences.getInt(key.name) as T?;
      case const (double):
        return _preferences.getDouble(key.name) as T?;
      case const (bool):
        return _preferences.getBool(key.name) as T?;
      default:
        throw Exception('Type is not supported');
    }
  }

  @override
  Set<String> getKeys() {
    return _preferences.getKeys();
  }
}
