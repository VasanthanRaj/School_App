import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../themes/colors_theme.dart';
import '../utils/image_assets.dart';

class SnackNotification {
  static error({message = ''}) {
    Get.snackbar(
      '',
      message,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      titleText: Container(
        width: Get.size.width,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 5,
              style: BorderStyle.solid,
              color: ThemeColor.secondaryRed,
            ),
          ),
        ),
      ),
      messageText: Container(
        width: Get.size.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                CupertinoIcons.exclamationmark_triangle_fill,
                color: ThemeColor.secondaryRed,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Error',
                    ),
                    Text(
                      message,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      snackStyle: SnackStyle.GROUNDED,
    );
  }

  static warning({message = ''}) {
    Get.snackbar(
      '',
      message,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      titleText: Container(
        width: Get.size.width,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 5,
              style: BorderStyle.solid,
              color: ThemeColor.primaryYellow,
            ),
          ),
        ),
      ),
      messageText: Container(
        width: Get.size.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                CupertinoIcons.exclamationmark_triangle_fill,
                color: ThemeColor.primaryYellow,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Warning',
                    ),
                    Text(
                      message,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      snackStyle: SnackStyle.GROUNDED,
    );
  }

  static success({message = ''}) {
    Get.snackbar(
      '',
      message,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      titleText: Container(
        width: Get.size.width,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 5,
              style: BorderStyle.solid,
              color: ThemeColor.primaryGreen,
            ),
          ),
        ),
      ),
      messageText: Container(
        width: Get.size.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                CupertinoIcons.checkmark_circle_fill,
                color: ThemeColor.primaryGreen,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Success',
                      // style: poppinsRegular(color: ThemeColor.primaryGreen),
                    ),
                    Text(
                      message,
                      // style: poppinsRegular(color: ThemeColor.primaryDarkGrey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      snackStyle: SnackStyle.GROUNDED,
    );
  }

  static message({message = '', svgRes = SvgRes.lightBulb}) {
    Get.snackbar(
      '',
      message,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      titleText: Container(
        width: Get.size.width,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 5,
              style: BorderStyle.solid,
              color: ThemeColor.secondaryDarkGrey,
            ),
          ),
        ),
      ),
      messageText: Container(
        width: Get.size.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(svgRes, height: 30, width: 20),
              Text(
                message,
              ),
            ],
          ),
        ),
      ),
      snackStyle: SnackStyle.GROUNDED,
    );
  }
}
