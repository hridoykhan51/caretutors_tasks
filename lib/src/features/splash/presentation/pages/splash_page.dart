import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_durations.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/router/app_route.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/splash_controller.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future<void> finishSplash() async {
        await Future<void>.delayed(AppDurations.splashDisplay);
        await ref.read(splashControllerProvider.notifier).completeFirstLaunch();

        if (!context.mounted) {
          return;
        }

        context.goNamed(AppRoute.login.routeName);
      }

      finishSplash();
      return null;
    }, const []);

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.lg),
          child: Column(
            children: [
              const Spacer(),
              Container(
                width: 104,
                height: 104,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.12),
                      blurRadius: 28,
                      offset: const Offset(0, 14),
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: AppColors.accent.withValues(alpha: 0.14),
                        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                      ),
                    ),
                    const Icon(
                      Icons.edit_note_rounded,
                      color: AppColors.primary,
                      size: AppSizes.iconLg,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSizes.xl),
              Text(
                AppStrings.appName,
                textAlign: TextAlign.center,
                style: textTheme.displaySmall,
              ),
              const SizedBox(height: AppSizes.sm),
              Text(
                AppStrings.splashSubtitle,
                textAlign: TextAlign.center,
                style: textTheme.bodyLarge,
              ),
              const Spacer(),
              SizedBox(
                width: 42,
                height: 42,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Theme.of(context).colorScheme.primary,
                  backgroundColor: AppColors.border,
                ),
              ),
              const SizedBox(height: AppSizes.xl),
            ],
          ),
        ),
      ),
    );
  }
}
