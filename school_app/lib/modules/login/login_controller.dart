import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/providers/AuthenticationAPI.dart';
import '../../routes/app_routes.dart';
import '../../utils/local_storage.dart';
import '../../widgets/snackbars.dart';

class LoginController extends GetxController {
  //API provider
  AuthenticationAPI authenticationApi = AuthenticationAPI();


  final LocalStorage localStorage = Get.find<LocalStorage>();

  //controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool passwordObscure = false;
  bool isLoading = false;

  String errorEmail = "";

  void visiblePassword() {
    passwordObscure = !passwordObscure;
    update();
  }

  void login() async {
    isLoading = true;
    update();

    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(
        emailController.text)) {
      errorEmail = 'Please enter a valid email address';
      isLoading = false;
    } else {
      errorEmail = '';
      update();
      var results = await authenticationApi.loginAPI(
          email: emailController.text, password: passwordController.text);
      if (results != null) {
        var result = jsonDecode(results);

        if (result['status'] == 1) {
          isLoading = false;
          print(result['data']['token']);
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setString(
              'token', result['data']['token']
          );
          preferences.setString(
              'userId', result['data']['id'].toString()
          );
          localStorage.setLocalData(
              tokenLocal: result['data']['token'],
              userIdLocal: result['data']['id'].toString());
          update();
          SnackNotification.success(
            message: result['message'],
          );
          Get.offNamedUntil(AppRoutes.home, (_) => false);
        } else if (result['status'] == 0) {
          isLoading = false;
          SnackNotification.error(
            message: result['message'],
          );
        } else {
          isLoading = false;
        }
        update();
      }
    }
    update();
  }
}
