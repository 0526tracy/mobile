import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:budget_hub/screens/dashboard.dart';

void main() {
  testWidgets('screen displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(home: DashboardScreen()),
    );

    expect(find.text('This is dashboard'), findsOneWidget);
  });
}
