import 'package:flutter/material.dart';

class BottomTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          title: Text('Dashboard'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.email),
          title: Text('Budget'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance),
          title: Text('Accounts'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.insert_chart),
          title: Text('Reports'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text('Settings'),
        ),
      ],
    );
  }
}
