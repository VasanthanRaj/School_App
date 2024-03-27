import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../routes/app_routes.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool passwordObscure = true;
  bool confirmPasswordObscure = true;

  String email = "";
  String password = "";
  String name = "";
  String confirmPassword = "";

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                      color: const Color(0xFFE9DDC1),
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
                            style:  TextStyle(
                                fontSize: 48
                            ),
                          ),
                          const SizedBox(height: 10),
                          CommonTextFormField(
                            keyboardType: TextInputType.emailAddress,
                            hintText: 'Name',
                            labelText: 'Name',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              // Add more complex email validation if needed
                              if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                            onSave: (value) {
                              name = value!;
                            },
                          ),
                          const SizedBox(height: 20),
                          CommonTextFormField(
                            keyboardType: TextInputType.emailAddress,
                            hintText: 'Email',
                            labelText: 'Email',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              // Add more complex email validation if needed
                              if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                            onSave: (value) {
                              email = value!;
                            },
                          ),
                          const SizedBox(height: 20),
                          CommonTextFormFieldPassword(
                              labelText: 'Password',
                              hintText: 'Password',
                              passwordObscure: passwordObscure,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                // Add more complex password validation if needed
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters long';
                                }
                                return null;
                              },
                              onSave: (value) {
                                password = value!;
                              },
                              onView: () {
                                setState(() {
                                  passwordObscure = !passwordObscure;
                                });
                              }),
                          const SizedBox(height: 20),
                          CommonTextFormFieldPassword(
                              labelText: 'Confirm Password',
                              hintText: 'Confirm Password',
                              passwordObscure: confirmPasswordObscure,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please confirm your password';
                                }
                                if (value != password) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                              onSave: (value) {
                                confirmPassword = value!;
                              },
                              onView: () {
                                setState(() {
                                  confirmPasswordObscure = !confirmPasswordObscure;
                                });
                              }),
                          const SizedBox(height: 80),
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                minimumSize: MaterialStateProperty.all(const Size(240, 47.0)),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  print('Validated Email: $email');
                                  print('Validated Password: $password');
                                  Navigator.pushReplacementNamed(context, AppRoutes.homePage);
                                }
                              },
                              child: const Text(
                                "Sign up",
                                style:  TextStyle(
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
                                onTap: () => {
                                  Navigator.pop(context)
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
