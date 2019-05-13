import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:budget_hub/themes/light.dart';

import 'package:budget_hub/state/authentication.dart';

import 'package:budget_hub/screens/landing.dart';
import 'package:budget_hub/screens/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <ChangeNotifierProvider<dynamic>>[
        ChangeNotifierProvider<AuthenticationState>(
            builder: (BuildContext context) => AuthenticationState()),
      ],
      child: MaterialApp(
        title: 'BudgetHub',
        theme: lightTheme,
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) {
            return Consumer<AuthenticationState>(
              builder: (BuildContext context,
                  AuthenticationState authenticationState, _) {
                if (authenticationState.authenticated) {
                  return DashboardScreen();
                } else {
                  return LandingScreen();
                }
              },
            );
          },
          '/dashboard': (BuildContext context) => DashboardScreen(),
        },
      ),
    );
  }
}
