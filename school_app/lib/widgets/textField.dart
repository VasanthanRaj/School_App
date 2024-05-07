import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/themes/colors_theme.dart';

class CommonTextField extends StatelessWidget {
  final keyboardType;
  final String labelText;
  final String hintText;
  final textController;

  const CommonTextField({
    super.key,
    this.keyboardType = TextInputType.text,
    required this.labelText,
    required this.hintText,
    required this.textController,
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
            padding: const EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: ThemeColor.primary, width: 3),
              borderRadius: BorderRadius.circular(6.0),
            ),
            height: 45,
            child: TextField(
              autocorrect: true,
              keyboardType: keyboardType,
              controller: textController,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
