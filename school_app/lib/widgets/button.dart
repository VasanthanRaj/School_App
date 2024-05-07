import 'package:flutter/material.dart';

import '../themes/colors_theme.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final void Function() onPress;

  const CommonButton({
    required this.width,
    required this.title,
    required this.height,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10.0), // Adjust the radius as needed
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          minimumSize: MaterialStateProperty.all(Size(width, height)),
        ),
        onPressed: onPress,
        child: Text(
          title,
          style: const TextStyle(fontSize: 24, color: ThemeColor.primary),
        ));
  }
}
