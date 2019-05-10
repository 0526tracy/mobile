import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:budget_hub/screens/landing.dart';

void main() {
  testWidgets('screen displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(home: LandingScreen()),
    );

    expect(find.text('LOGIN'), findsOneWidget);
    expect(find.text("Don't have an account?"), findsOneWidget);
    expect(find.text('Sign up!'), findsOneWidget);
  });
}
