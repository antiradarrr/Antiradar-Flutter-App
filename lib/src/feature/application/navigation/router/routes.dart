import 'package:antiradar/src/feature/settings/presentation/screens/setting_screen.dart';
import 'package:antiradar/src/feature/splash_screen/presentation/screens/select_language_screen.dart';
import 'package:antiradar/src/feature/splash_screen/presentation/screens/select_theme_screen.dart';
import 'package:antiradar/src/feature/splash_screen/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/antiradar',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SelectLaguageScreen();
      },
    ),
    GoRoute(
      path: '/select-theme',
      builder: (BuildContext context, GoRouterState state) {
        return const SelectThemeScreen();
      },
    ),
    GoRoute(
        path: '/welcome',
        builder: (BuildContext context, GoRouterState state) {
          return const WelcomeScreen();
        }),
    GoRoute(
        path: '/antiradar',
        builder: (context, state) {
          return const Scaffold();
        }),
    GoRoute(
        path: '/settings',
        builder: (context, state) {
          return const SettingScreen();
        })
  ],
);
