import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkErrorItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Text(
              'Internet connection lost!',
              // style: poppinsRegular(color: ThemeColor.primaryGrey),
            ),
            Text(
              'Check your connection and try again.',
              // style: poppinsRegular(color: ThemeColor.primaryGrey),
            )
          ],
        ),
      ),
    );
  }
}
