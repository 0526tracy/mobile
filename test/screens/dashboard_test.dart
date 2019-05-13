import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:budget_hub/screens/dashboard.dart';
import 'package:budget_hub/state/authentication.dart';

void main() {
  testWidgets('screen displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<AuthenticationState>(
            builder: (BuildContext context) => AuthenticationState(),
            child: DashboardScreen()),
      ),
    );

    expect(find.text('This is dashboard'), findsOneWidget);
  });
}
