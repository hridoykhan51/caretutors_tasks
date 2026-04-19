import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/storage/storage_keys.dart';

final showSplashOnStartProvider = Provider<bool>((ref) => true);

class AppBootstrap {
  const AppBootstrap._();

  static Future<AppBootstrapResult> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    final sharedPreferences = await SharedPreferences.getInstance();
    final hasSeenSplash =
        sharedPreferences.getBool(StorageKeys.hasSeenSplash) ?? false;

    return AppBootstrapResult(
      sharedPreferences: sharedPreferences,
      showSplashOnStart: !hasSeenSplash,
    );
  }
}

class AppBootstrapResult {
  const AppBootstrapResult({
    required this.sharedPreferences,
    required this.showSplashOnStart,
  });

  final SharedPreferences sharedPreferences;
  final bool showSplashOnStart;
}
