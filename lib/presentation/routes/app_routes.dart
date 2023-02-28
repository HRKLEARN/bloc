

import 'package:clean_architecture_bloc_firebase/presentation/screens/home_screen.dart';
import 'package:clean_architecture_bloc_firebase/presentation/screens/sign_in.dart';
import 'package:clean_architecture_bloc_firebase/presentation/screens/sign_up.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';

  static Map<String, WidgetBuilder> routes() {
    return {
      login: (context) => const SignIn(),
      register: (context) => const SignUp(),
      home: (context) => const HomeScreen()
    };
  }
}
