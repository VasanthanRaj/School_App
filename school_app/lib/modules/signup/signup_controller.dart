import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {

  //controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool passwordObscure = false;
  bool confirmPasswordObscure = false;

  void visiblePassword() {
    passwordObscure = !passwordObscure;
    update();
  }

  void visibleConfirmPassword() {
    confirmPasswordObscure = !confirmPasswordObscure;
    update();
  }
}

// if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
// return 'Please enter a valid email address';
// }
