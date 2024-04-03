import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:school_app/modules/splash/splash_controller.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) => Scaffold(),
    );
  }
}
