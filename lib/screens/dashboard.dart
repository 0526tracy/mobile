import 'package:flutter/material.dart';

import 'package:budget_hub/widgets/bottom_tab_bar.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: const Text('This is dashboard'),
      ),
      bottomNavigationBar: BottomTabBar(),
    );
  }
}
