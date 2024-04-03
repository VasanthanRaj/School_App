import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/providers/AuthenticationAPI.dart';
import '../../data/providers/GetAPI.dart';
import '../../routes/app_routes.dart';
import '../../utils/local_storage.dart';
import '../../widgets/snackbars.dart';

class LoginController extends GetxController {
  //API provider
  AuthenticationAPI authenticationApi = AuthenticationAPI();
  final GetAPI getAPI = Get.find<GetAPI>();

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

    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
        .hasMatch(emailController.text)) {
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
          print(result['data']['token']);
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setString('token', result['data']['token']);
          preferences.setString('userId', result['data']['id'].toString());
          localStorage.setLocalData(
              tokenLocal: result['data']['token'],
              userIdLocal: result['data']['id'].toString());
          update();
          userDetails();
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

  void userDetails() async {
    var results = await getAPI.userDetailsAPI();
    if (results != null) {
      storeUserData(
          userName: results['name'] ?? '',
          email: results['email'] ?? '',
          image: results['imagepath'] ?? '',
          phoneNumber: results['phonenumber'] ?? '',
          address: results['address'] ?? '',
          webUrl: results['weburl'] ?? '');
    }
  }

  void storeUserData({
    required String userName,
    required String email,
    required String image,
    required String phoneNumber,
    required String address,
    required String webUrl,
  }) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('userName', userName);
    preferences.setString('email', email);
    preferences.setString('image', image);
    preferences.setString('phoneNumber', phoneNumber);
    preferences.setString('address', address);
    preferences.setString('webUrl', webUrl);

    isLoading = false;
    localStorage.setuserDetails(
        userNameLocal: userName,
        emailLocal: email,
        imageLocal: image,
        phoneNumberLocal: phoneNumber,
        addressLocal: address,
        webUrlLocal: webUrl);

    update();

    SnackNotification.success(
      message: "Logged in successfully",
    );
    Get.offNamedUntil(AppRoutes.home, (_) => false);
  }
}
