import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'src/app/bootstrap/app_bootstrap.dart';
import 'src/app/caretutor_notes_app.dart';
import 'src/core/storage/shared_preferences_provider.dart';

Future<void> main() async {
  final bootstrap = await AppBootstrap.initialize();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(
          bootstrap.sharedPreferences,
        ),
        showSplashOnStartProvider.overrideWithValue(
          bootstrap.showSplashOnStart,
        ),
      ],
      child: const CareTutorNotesApp(),
    ),
  );
}
