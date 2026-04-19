import 'package:hooks_riverpod/legacy.dart';

import '../../domain/usecases/mark_splash_as_seen.dart';

final splashControllerProvider = StateNotifierProvider<SplashController, bool>((
  ref,
) {
  final markSplashAsSeen = ref.watch(markSplashAsSeenProvider);
  return SplashController(markSplashAsSeen);
});

class SplashController extends StateNotifier<bool> {
  SplashController(this._markSplashAsSeen) : super(false);

  final MarkSplashAsSeen _markSplashAsSeen;

  Future<void> completeFirstLaunch() async {
    state = true;
    await _markSplashAsSeen();
  }
}
