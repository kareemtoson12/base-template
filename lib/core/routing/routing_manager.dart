import 'package:flutter/material.dart';
import '../../features/auth/login/login_screen.dart';
import '../../features/auth/sign_up/sign_up_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/splash/splash_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.signUpRoute:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
