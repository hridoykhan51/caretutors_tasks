import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/storage/shared_preferences_provider.dart';
import '../../../../core/storage/storage_keys.dart';

final splashLocalDataSourceProvider = Provider<SplashLocalDataSource>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return SharedPreferencesSplashLocalDataSource(sharedPreferences);
});

abstract class SplashLocalDataSource {
  bool hasSeenSplash();

  Future<void> markSplashAsSeen();
}

class SharedPreferencesSplashLocalDataSource implements SplashLocalDataSource {
  const SharedPreferencesSplashLocalDataSource(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  @override
  bool hasSeenSplash() {
    return _sharedPreferences.getBool(StorageKeys.hasSeenSplash) ?? false;
  }

  @override
  Future<void> markSplashAsSeen() async {
    await _sharedPreferences.setBool(StorageKeys.hasSeenSplash, true);
  }
}
