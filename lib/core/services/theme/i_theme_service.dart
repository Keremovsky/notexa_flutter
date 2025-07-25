part of "theme_service.dart";

abstract interface class IThemeService extends ChangeNotifier {
  void setTheme(ThemeMode themeMode);
  bool isLightTheme();
  bool isDarkTheme();
}
