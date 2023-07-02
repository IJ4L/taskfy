import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/themes/colors.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isClick = navigationShell.currentIndex;
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        elevation: 0,
        height: 60,
        selectedIndex: navigationShell.currentIndex,
        backgroundColor: kBackgroundColor,
        indicatorColor: kBackgroundColor,
        surfaceTintColor: kBackgroundColor,
        shadowColor: kBackgroundColor,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: _goBranch,
        destinations: [
          NavigationDestination(
            label: 'a',
            icon: Image.asset(
              "assets/icons/home_alt_fill.png",
              color: isClick == 0 ? null : kTextColor,
              fit: BoxFit.fill,
              height: 32,
              width: 32,
            ),
          ),
          NavigationDestination(
            label: 'b',
            icon: Image.asset(
              "assets/icons/calendar.png",
              color: isClick == 1 ? null : kTextColor,
              fit: BoxFit.fill,
              height: 32,
              width: 32,
            ),
          ),
        ],
      ),
    );
  }
}
