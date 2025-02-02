import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:yanmii_wallet/main.dart' as app;
import 'package:yanmii_wallet/src/common/components/button.dart';
import 'package:yanmii_wallet/src/features/auth/login/login_screen.dart';
import 'package:yanmii_wallet/src/features/main/main_screen.dart';
import 'package:yanmii_wallet/src/features/onboarding/onboarding_screen.dart'; // Replace with your app's entry point.

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  testWidgets('Test the app scenario', (WidgetTester tester) async {
    app.main(); // Start your app.

    // Verify that the splash screen is displayed.
    await tester
        .pumpAndSettle(const Duration(seconds: 3)); // Wait for 3 seconds.

    // Verify that the onboarding screen is displayed.
    expect(find.byType(OnboardingScreen), findsOneWidget);

    // Swipe through onboarding screens or tap the skip button.
    for (var i = 0; i < 3; i++) {
      if (i < 2) {
        await tester.tap(find.byKey(OnboardingScreen.onNextButtonKey));
      } else {
        await tester.tap(find.text('Start'));
      }
      await tester.pumpAndSettle();
    }

    // Verify that the login screen is displayed.
    expect(find.byType(MainScreen), findsOneWidget);

    await tester.tap(find.text('TAB5'));
    await tester.pumpAndSettle();

    // Verify that the login screen is displayed.
    expect(find.byType(LoginScreen), findsOneWidget);

    // Verify that the login button is enabled.
    final loginFinder = find.byKey(LoginScreen.loginButton);
    expect(loginFinder, findsOneWidget);

    expect(
      (loginFinder.evaluate().single.widget as CommonButton).isDisabled,
      true,
    );

    // Fill in username and password.
    await tester.enterText(find.byKey(LoginScreen.emailField), 'kahfi');
    await tester.pump();
    await tester.enterText(find.byKey(LoginScreen.passwordField), 'abcdef');
    await tester.pump();
    await Future.delayed(const Duration(seconds: 1), () {});

    expect(
      (loginFinder.evaluate().single.widget as CommonButton).isDisabled,
      true,
    );

    await tester.tap(find.byKey(LoginScreen.emailField));
    await tester.pump();
    await tester.enterText(
      find.byKey(const Key('email_field')),
      'kahfi@gmail.com',
    );
    await tester.pump();
    await tester.tap(find.byKey(LoginScreen.passwordField));
    await tester.pump();
    await tester.enterText(find.byKey(LoginScreen.passwordField), 'aaa111!!');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(
      (loginFinder.evaluate().single.widget as CommonButton).isDisabled,
      false,
    );

    // Tap the login button.
    await tester.tap(loginFinder);
    await tester.pumpAndSettle();
  });
}
