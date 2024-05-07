import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:school_app/modules/home/home_controller.dart';
import 'package:school_app/themes/colors_theme.dart';
import 'package:school_app/utils/image_assets.dart';
import 'package:school_app/widgets/appBar.dart';
import 'package:school_app/widgets/button.dart';

class DataUpload extends StatelessWidget {
  const DataUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => SafeArea(
                child: Scaffold(
              appBar: AppBarWidget(),
              backgroundColor: ThemeColor.primary,
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    const Text(
                      "Please choose either Excel or Google Forms to upload your information. Once selected proceed to fill in the required details. After completion upload the file",
                      style: TextStyle(
                          fontSize: 14,
                          color: ThemeColor.white,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Image.asset(ImgRes.excel),
                            const SizedBox(height: 10),
                            const Text(
                              "Excel",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: ThemeColor.white),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(ImgRes.form),
                            const SizedBox(height: 10),
                            const Text(
                              "Google Forms",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: ThemeColor.white),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Container(
                        height: 240,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(50),
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: ThemeColor.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: SvgPicture.asset(
                          SvgRes.cloud,
                        )),
                    const SizedBox(height: 80),
                    CommonButton(
                        width: 30,
                        title: 'Submit',
                        height: 47,
                        onPress: () => {print("Button Pressed")}),
                  ],
                ),
              ),
            )));
  }
}
