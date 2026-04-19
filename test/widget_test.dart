import 'package:caretutor_task/src/app/bootstrap/app_bootstrap.dart';
import 'package:caretutor_task/src/app/caretutor_notes_app.dart';
import 'package:caretutor_task/src/core/constants/app_durations.dart';
import 'package:caretutor_task/src/core/constants/app_strings.dart';
import 'package:caretutor_task/src/core/storage/shared_preferences_provider.dart';
import 'package:caretutor_task/src/core/storage/storage_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    GoogleFonts.config.allowRuntimeFetching = false;
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('shows splash screen on first launch', (tester) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(sharedPreferences),
          showSplashOnStartProvider.overrideWithValue(true),
        ],
        child: const CareTutorNotesApp(),
      ),
    );

    expect(find.text(AppStrings.appName), findsOneWidget);
    expect(find.text(AppStrings.splashSubtitle), findsOneWidget);

    await tester.pump(AppDurations.splashDisplay);
    await tester.pumpAndSettle();

    expect(sharedPreferences.getBool(StorageKeys.hasSeenSplash), isTrue);
  });
}
