import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:school_app/constants/auth_api.dart';
import 'package:school_app/model/model.dart';
import 'package:school_app/utils/constant.dart';

import '../constants/constants.dart';
import '../routes/app_routes.dart';
import '../utils/sharedPreferance.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool passwordObscure = true;

  String email = "";
  String password = "";

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
                        CommonTextFormField(
                          keyboardType: TextInputType.emailAddress,
                          hintText: 'Email',
                          labelText: 'Email',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            // Add more complex email validation if needed
                            if (!RegExp(
                                    r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          onSave: (value) {
                            print("Testing" + value!);
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
                              // Navigator.pushReplacementNamed(
                              //     context, AppRoutes.homePage);
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                              }
                              var url = '$baseUrl$auth';
                              var body = jsonEncode(<String, String>{
                                "email": email,
                                "password": password
                              });
                              print(body);
                              var response =
                                  await LoginApiCall(body, url, context);
                              final Map<String, dynamic> responseData =
                                  jsonDecode(response!);
                              Response responseModel =
                                  Response.fromJson(responseData);
                              print(responseModel.data.token);
                              if (responseData['message'] == 'success') {
                                print("Enter");
                                TokenManager.saveToken(
                                    responseModel.data.token);
                                Navigator.pushReplacementNamed(
                                    context, AppRoutes.homePage);
                              } else {}
                            },
                            child: const Text(
                              "Log In",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.black),
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
                              onTap: () => {
                                Navigator.pushNamed(
                                    context, AppRoutes.signupPage)
                              },
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
