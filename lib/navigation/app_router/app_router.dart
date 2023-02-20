import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poc/navigation/bottom_navigation/bottom_navigation_wrapper.dart';
import 'package:poc/screens/app/business.dart';
import 'package:poc/screens/app/home.dart';
import 'package:poc/screens/app/school.dart';
import 'package:poc/screens/second.dart';

class AppRouter {
  static const String home = '/';
  static const String second = '/second';

  static GoRouter routerConfig() {
    return GoRouter(
      routes: [
        GoRoute(
          path: home,
          builder: (context, state) {
            return const BottomNavigationWrapper(
              initialIndex: 0,
              navigationItems: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Business',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school),
                  label: 'School',
                ),
              ],
              children: [HomeScreen(), BusinessScreen(), SchoolScreen()],
            );
          },
        ),
        GoRoute(
          path: second,
          builder: (context, state) =>
              const SecondScreen(title: 'Flutter Demo Second Page'),
        ),
      ],
    );
  }
}
