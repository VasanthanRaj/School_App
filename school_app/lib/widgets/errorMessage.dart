import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../themes/colors_theme.dart';

Widget ErrorMessage(message) {
  return Container(
    padding: const EdgeInsets.only(left: 5),
    height: 20,
    width: Get.width,
    child: Text(
      message,
      style: const TextStyle(
          color: ThemeColor.secondaryRed
      ),
    ),
  );
}