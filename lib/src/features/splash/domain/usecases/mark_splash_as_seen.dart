import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/repositories/splash_repository_impl.dart';
import '../repositories/splash_repository.dart';

final markSplashAsSeenProvider = Provider<MarkSplashAsSeen>((ref) {
  final repository = ref.watch(splashRepositoryProvider);
  return MarkSplashAsSeen(repository);
});

class MarkSplashAsSeen {
  const MarkSplashAsSeen(this._repository);

  final SplashRepository _repository;

  Future<void> call() {
    return _repository.markSplashAsSeen();
  }
}
