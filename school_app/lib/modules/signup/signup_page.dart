import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:school_app/themes/colors_theme.dart';

import '../../widgets/textField.dart';
import '../../widgets/textFormFieldPassword.dart';
import 'signup_controller.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (controller) =>
          SafeArea(
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
                          borderRadius: BorderRadius.circular(150)
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
                          color: ThemeColor.primary,
                        ),
                        width: Get.width,
                        // height: MediaQuery.of(context).size.height,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              const Text(
                                "School Name",
                                style: TextStyle(
                                    fontSize: 48
                                ),
                              ),
                              const SizedBox(height: 10),
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
                                  }
                              ),
                              const SizedBox(height: 20),
                              CommonTextFormFieldPassword(
                                  labelText: 'Confirm Password',
                                  hintText: 'Confirm Password',
                                  textController: controller
                                      .confirmPasswordController,
                                  passwordObscure: controller
                                      .confirmPasswordObscure,
                                  onView: () {
                                    controller.visibleConfirmPassword();
                                  }
                              ),
                              const SizedBox(height: 80),
                              ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<
                                        Color>(Colors.white),
                                    minimumSize: MaterialStateProperty.all(
                                        const Size(240, 47.0)),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    "Sign up",
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.black
                                    ),
                                  )
                              ),
                              const SizedBox(height: 100),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Have an account? ",
                                    style: TextStyle(
                                        fontSize: 16
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () =>
                                    {
                                      Get.back()
                                    },
                                    child: const Text(
                                      "Login",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 50)
                            ],
                          ),
                        )
                    )
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
