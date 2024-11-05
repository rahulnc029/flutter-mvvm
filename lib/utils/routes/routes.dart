import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/view/home_screen.dart';
import 'package:flutter_mvvm/view/login_screen.dart';
import 'package:flutter_mvvm/view/signUp_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case RoutesName.signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No Routes Defined"),
            ),
          );
        });
    }
  }
}