import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:school_app/themes/colors_theme.dart';

import '../../utils/image_assets.dart';
import '../../widgets/textField.dart';
import '../../widgets/textFormFieldPassword.dart';
import 'signup_controller.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  fit: StackFit.passthrough,
                  alignment: Alignment.bottomCenter,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 50),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: ThemeColor.primary,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.elliptical(1100, 450))),
                        width: Get.width,
                        height: 250,
                      ),
                    ),
                    Image.asset(ImgRes.logo)
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 32),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                CommonTextField(
                  keyboardType: TextInputType.text,
                  hintText: 'Name',
                  labelText: 'Name',
                  textController: controller.nameController,
                ),
                const SizedBox(height: 20),
                CommonTextField(
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Email',
                  labelText: 'Email',
                  textController: controller.emailController,
                ),
                const SizedBox(height: 20),
                CommonTextFormFieldPassword(
                    labelText: 'Password',
                    hintText: 'Password',
                    textController: controller.passwordController,
                    passwordObscure: controller.passwordObscure,
                    onView: () {
                      controller.visiblePassword();
                    }),
                const SizedBox(height: 20),
                CommonTextFormFieldPassword(
                    labelText: 'Confirm Password',
                    hintText: 'Confirm Password',
                    textController: controller.confirmPasswordController,
                    passwordObscure: controller.confirmPasswordObscure,
                    onView: () {
                      controller.visibleConfirmPassword();
                    }),
                const SizedBox(height: 50),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(ThemeColor.primary),
                      minimumSize:
                          MaterialStateProperty.all(const Size(240, 47.0)),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Sign up",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    )),
                const SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Have an account? ",
                      style: TextStyle(fontSize: 16),
                    ),
                    InkWell(
                      onTap: () => {Get.back()},
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ThemeColor.primary),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
