import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/repositories/splash_repository.dart';
import '../datasources/splash_local_data_source.dart';

final splashRepositoryProvider = Provider<SplashRepository>((ref) {
  final localDataSource = ref.watch(splashLocalDataSourceProvider);
  return SplashRepositoryImpl(localDataSource);
});

class SplashRepositoryImpl implements SplashRepository {
  const SplashRepositoryImpl(this._localDataSource);

  final SplashLocalDataSource _localDataSource;

  @override
  bool hasSeenSplash() {
    return _localDataSource.hasSeenSplash();
  }

  @override
  Future<void> markSplashAsSeen() {
    return _localDataSource.markSplashAsSeen();
  }
}
