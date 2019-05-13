import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:budget_hub/state/authentication.dart';
import 'package:budget_hub/widgets/bottom_tab_bar.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthenticationState authenticationState =
        Provider.of<AuthenticationState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('This is dashboard'),
          Text(authenticationState.authenticationToken),
          Text(authenticationState.user.username),
        ],
      ),
      bottomNavigationBar: BottomTabBar(),
    );
  }
}
