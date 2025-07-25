import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/enums/cache_keys_enum.dart';
import 'package:flutter_mobile/core/services/cache/cache_service.dart';

part 'i_theme_service.dart';

class ThemeService extends IThemeService {
  late CacheService _cacheService;
  late ThemeMode _currentTheme;

  ThemeMode get currentTheme => _currentTheme;

  factory ThemeService() => _instance;
  static final ThemeService _instance = ThemeService._init();

  ThemeService._init() {
    _cacheService = CacheService();

    int? theme = _cacheService.get<int>(CacheKeys.themeMode);
    _currentTheme = ThemeMode.values[theme ?? 1];

    log("ThemeService is Initialized");
  }

  @override
  void setTheme(ThemeMode themeMode) {
    _currentTheme = themeMode;
    _cacheService.set<int>(CacheKeys.themeMode, _currentTheme.index);
    notifyListeners();
  }

  @override
  bool isLightTheme() {
    return _currentTheme == ThemeMode.light;
  }

  @override
  bool isDarkTheme() {
    return _currentTheme == ThemeMode.dark;
  }
}
