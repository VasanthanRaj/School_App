import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/signup_page.dart';

class AppPages {
  static final pageRoutes = <String, WidgetBuilder> {
    '/homePage': (context) => const HomePage(),
    '/loginPage': (context) => const LoginPage(),
    '/signupPage': (context) => const SignupPage(),
  };
}