import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:budget_hub/screens/landing.dart';
import 'package:budget_hub/widgets/inverted_button.dart';

void main() {
  testWidgets('screen displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(home: LandingScreen()),
    );

    expect(find.byWidget(const InvertedButton(title: 'Login')), findsOneWidget);
    expect(
        find.byWidget(const InvertedButton(title: 'Register')), findsOneWidget);
    expect(find.text('Skip for now'), findsOneWidget);
  });
}
