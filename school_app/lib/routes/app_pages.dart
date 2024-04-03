import 'package:get/get.dart';
import 'package:school_app/modules/login/login_binding.dart';
import 'package:school_app/modules/login/login_page.dart';
import 'package:school_app/modules/section/section_binding.dart';
import 'package:school_app/modules/section/section_page.dart';
import 'package:school_app/modules/signup/signup_binding.dart';
import 'package:school_app/modules/signup/signup_page.dart';
import 'package:school_app/modules/students/student_binding.dart';
import 'package:school_app/modules/students/student_page.dart';
import 'package:school_app/routes/app_routes.dart';

import '../modules/home/home_binding.dart';
import '../modules/home/home_page.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_page.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      bindings: [HomeBinding()],
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: AppRoutes.section,
      page: () => SectionPage(),
      binding: SectionBinding(),
    ),
    GetPage(
      name: AppRoutes.students,
      page: () => StudentPage(),
      binding: StudentBinding(),
    ),
  ];
}
