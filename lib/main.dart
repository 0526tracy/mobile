import 'package:flutter/material.dart';

import 'package:budget_hub/themes/light.dart';
import 'package:budget_hub/bloc/provider/authentication.dart';
import 'package:budget_hub/bloc/authentication.dart';

import 'package:budget_hub/screens/landing.dart';
import 'package:budget_hub/screens/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthenticationBlocProvider(
      child: MaterialApp(
        title: 'BudgetHub',
        theme: lightTheme,
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) {
            final AuthenticationBloc authenticationBloc = AuthenticationBlocProvider.of(context);

            return StreamBuilder<bool>(
              stream: authenticationBloc.isAuthenticated,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
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
