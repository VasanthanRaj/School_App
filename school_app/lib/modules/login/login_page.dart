import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:school_app/routes/app_routes.dart';
import 'package:school_app/themes/colors_theme.dart';
import 'package:school_app/widgets/errorMessage.dart';

import '../../utils/image_assets.dart';
import '../../widgets/textField.dart';
import '../../widgets/textFormFieldPassword.dart';
import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
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
                    Image.asset(
                      ImgRes.logo
                    )
                    // SvgPicture.asset(SvgRes.logo),
                    // Positioned(
                    //   child: ,
                    // )
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
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 32),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                CommonTextField(
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Email',
                  labelText: 'Email',
                  textController: controller.emailController,
                ),
                if (controller.errorEmail.isNotEmpty)
                  ErrorMessage(controller.errorEmail),
                const SizedBox(height: 20),
                CommonTextFormFieldPassword(
                    labelText: 'Password',
                    hintText: 'Password',
                    passwordObscure: controller.passwordObscure,
                    onView: () {
                      controller.visiblePassword();
                    },
                    textController: controller.passwordController),
                const SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.only(right: 16),
                  alignment: Alignment.centerRight,
                  child: const Text(
                    'Forgot Password?',
                    textAlign: TextAlign.right,
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(ThemeColor.primary),
                      minimumSize:
                          MaterialStateProperty.all(const Size(240, 47.0)),
                    ),
                    onPressed: () async {
                      controller.login();
                    },
                    child: controller.isLoading
                        ? JumpingDots(
                            color: ThemeColor.white,
                            radius: 8,
                            numberOfDots: 3,
                            animationDuration:
                                const Duration(milliseconds: 500),
                          )
                        : const Text(
                            "Log In",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(fontSize: 16),
                    ),
                    InkWell(
                      onTap: () => {Get.toNamed(AppRoutes.signup)},
                      child: const Text(
                        "Sign Up",
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
