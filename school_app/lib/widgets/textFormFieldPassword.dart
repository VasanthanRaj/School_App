import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonTextFormFieldPassword extends StatelessWidget {
  final keyboardType;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final bool passwordObscure;
  final void Function() onView;
  final textController;

  const CommonTextFormFieldPassword({
    super.key,
    this.keyboardType = TextInputType.text,
    required this.labelText,
    required this.hintText,
    required this.onView,
    required this.passwordObscure,
    required this.textController,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 5),
          width: Get.width,
          child: Text(
            labelText,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Card(
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.0),
            ),
            height: 45,
            child: TextFormField(
              obscureText: !passwordObscure,
              keyboardType: keyboardType,
              controller: textController,
              decoration: InputDecoration(
                // hintText: hintText,
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(passwordObscure
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: onView,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
