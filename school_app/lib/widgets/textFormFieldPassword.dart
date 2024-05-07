import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/themes/colors_theme.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: Get.width,
          child: Text(
            labelText,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: ThemeColor.primary, width: 3),
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
                  color: ThemeColor.primary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
