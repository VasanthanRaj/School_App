import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:school_app/routes/app_routes.dart';
import 'package:school_app/themes/colors_theme.dart';
import 'package:school_app/widgets/errorMessage.dart';

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
                const SizedBox(height: 30),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE9DDC1),
                    borderRadius: BorderRadius.circular(150),
                  ),
                  width: 180,
                  height: 161,
                  child: const Text(
                    "Logo",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 48,
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                    color: Color(0xFFE9DDC1),
                  ),
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          "School Name",
                          style: TextStyle(fontSize: 48),
                        ),
                        const SizedBox(height: 10),
                        CommonTextField(
                          keyboardType: TextInputType.emailAddress,
                          hintText: 'Email',
                          labelText: 'Email',
                          textController: controller.emailController,
                        ),
                        if(controller.errorEmail.isNotEmpty)
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
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: const Text(
                            'Forgot Password?',
                            textAlign: TextAlign.right,
                          ),
                        ),
                        const SizedBox(height: 80),
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              minimumSize: MaterialStateProperty.all(
                                  const Size(240, 47.0)),
                            ),
                            onPressed: () async {
                              controller.login();
                            },
                            child: controller.isLoading
                                ? JumpingDots(
                                    color: ThemeColor.primary,
                                    radius: 8,
                                    numberOfDots: 3,
                                    animationDuration:
                                         const Duration(milliseconds: 500),
                                  )
                                : const Text(
                                    "Log In",
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.black),
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
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
