import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../app/bootstrap/app_bootstrap.dart';
import '../../features/auth/presentation/pages/login_placeholder_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import 'app_route.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final showSplashOnStart = ref.watch(showSplashOnStartProvider);

  return GoRouter(
    initialLocation: showSplashOnStart
        ? AppRoute.splash.path
        : AppRoute.login.path,
    routes: [
      GoRoute(
        path: AppRoute.splash.path,
        name: AppRoute.splash.routeName,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoute.login.path,
        name: AppRoute.login.routeName,
        builder: (context, state) => const LoginPlaceholderPage(),
      ),
    ],
  );
});
