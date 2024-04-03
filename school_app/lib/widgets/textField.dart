import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            child: TextField(
              autocorrect: true,
              keyboardType: keyboardType,
              controller: textController,
              decoration: const InputDecoration(
                // hintText: hintText,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
