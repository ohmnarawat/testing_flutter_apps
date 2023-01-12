import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testing_flutter_apps/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<void> enterTextByKey(
      WidgetTester tester, String key, String text) async {
    await tester.enterText(find.byKey(Key(key)), text);
    await tester.pumpAndSettle();
  }

  Future<void> tabByKey(WidgetTester tester, String key) async {
    await tester.tap(find.byKey(Key(key)));
    await tester.pumpAndSettle();
  }

  group('login test', () {
    testWidgets('login with user test01, fail wrong username or password',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Find widgets
      final usernameField = find.byKey(const Key('textfield_username'));
      final passwordField = find.byKey(const Key('textfield_password'));
      final signInButton = find.byKey(const Key('button_signin'));

      // Enter username
      await tester.enterText(usernameField, 'test01');
      await tester.pumpAndSettle();
      // Enter password
      await tester.enterText(passwordField, 'Wealth12345');
      await tester.pumpAndSettle();
      // Enter signIn
      await tester.tap(signInButton);
      await tester.pumpAndSettle();

      // Verify error message
      expect(find.text('WRONG_USERNAME_OR_PASSWORD'), findsOneWidget);
    });
    testWidgets('login with user test02, success', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Enter username, password
      await enterTextByKey(tester, 'textfield_username', 'test02');
      await enterTextByKey(tester, 'textfield_password', 'Wealth12345');

      // Tab signIn
      await tabByKey(tester, 'button_signin');
      await tester.pump(const Duration(seconds: 2));

      // Verify goto home page
      expect(find.text('Welcome test02'), findsOneWidget);
    });
    testWidgets('login with user test03, fail account lock', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Enter username, password
      await enterTextByKey(tester, 'textfield_username', 'test03');
      await enterTextByKey(tester, 'textfield_password', 'Wealth12345');

      // Tab signIn
      await tabByKey(tester, 'button_signin');

      // Verify error message
      expect(find.text('ACCOUNT_LOCK'), findsOneWidget);
    });
    testWidgets('login with user test04, fail force change password',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Enter username, password
      await enterTextByKey(tester, 'textfield_username', 'test04');
      await enterTextByKey(tester, 'textfield_password', 'Wealth12345');

      // Tab signIn
      await tabByKey(tester, 'button_signin');
      await tester.pump(const Duration(seconds: 2));

      // Verify goto change password page
      expect(find.text('Change Password'), findsWidgets);
    });
  });
}
