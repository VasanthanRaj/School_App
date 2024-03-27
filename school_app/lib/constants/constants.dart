import 'package:flutter/material.dart';

class CommonTextFormField extends StatelessWidget {

  final keyboardType;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final String? Function(String?) validator;
  final String? Function(String?) onSave;

  const CommonTextFormField({
    super.key,
    this.keyboardType = TextInputType.text,
    required this.labelText,
    required this.hintText,
    required this.validator,
    required this.onSave,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 5),
          width: MediaQuery.sizeOf(context).width,
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
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.0),
            ),
            height: 45,
            child: TextFormField(
                keyboardType: keyboardType,
                decoration: InputDecoration(
                  // hintText: hintText,
                  border: InputBorder.none,
                ),
                validator: validator,
                onSaved: onSave
            ),
          ),
        ),
      ],
    );
  }
}

class CommonTextFormFieldPassword extends StatelessWidget {

  final keyboardType;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final bool passwordObscure;
  final String? Function(String?) validator;
  final String? Function(String?) onSave;
  final void Function() onView;

  const CommonTextFormFieldPassword({
    super.key,
    this.keyboardType = TextInputType.text,
    required this.labelText,
    required this.hintText,
    required this.validator,
    required this.onSave,
    required this.onView,
    required this.passwordObscure,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 5),
          width: MediaQuery.sizeOf(context).width,
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
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.0),
            ),
            height: 45,
            child: TextFormField(
                obscureText: !passwordObscure,
                keyboardType: keyboardType,
                decoration: InputDecoration(
                  // hintText: hintText,
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: Icon(passwordObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: onView,
                  ),
                ),
                validator: validator,
                onSaved: onSave
            ),
          ),
        ),
      ],
    );
  }
}

class SnackBarHelper {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        // backgroundColor: Colors.white,
      ),
    );
  }

  static void showInfo(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.blue,
      ),
    );
  }

// You can define more methods for different types of SnackBars
}