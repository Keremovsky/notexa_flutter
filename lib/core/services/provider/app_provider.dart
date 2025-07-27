import 'package:flutter_mobile/core/services/cache/cache_service.dart';
import 'package:flutter_mobile/core/services/file/file_service.dart';
import 'package:flutter_mobile/core/services/secure_storage/secure_storage_service.dart';
import 'package:flutter_mobile/core/services/theme/theme_service.dart';
import 'package:flutter_mobile/core/utils/feedback_util.dart';
import 'package:flutter_mobile/features/auth/controller/auth_controller.dart';
import 'package:flutter_mobile/features/chat/controller/chat_controller.dart';
import 'package:flutter_mobile/features/workspace/controller/workspace_controller.dart';
import 'package:flutter_mobile/router/router.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProvider {
  factory AppProvider() => _instance;
  static final AppProvider _instance = AppProvider._init();

  AppProvider._init();

  List<SingleChildWidget> dependItems() {
    return [
      Provider(create: (_) => CacheService()),
      Provider(create: (_) => FileService()),
      Provider(create: (_) => SecureStorageService()),
      ChangeNotifierProvider(create: (_) => AppRouter()),
      ChangeNotifierProvider(create: (_) => ThemeService()),
      ChangeNotifierProvider(create: (_) => AuthController()),
      ChangeNotifierProvider(create: (_) => ChatController()),
      ChangeNotifierProvider(create: (_) => WorkspaceController()),
      Provider(create: (_) => FeedbackUtil()),
    ];
  }

  static Future<void> ensureInitialized() async {
    await CacheService().ensureInitialized();
  }
}
