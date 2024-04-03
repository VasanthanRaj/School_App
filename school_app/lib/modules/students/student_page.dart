import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:school_app/themes/colors_theme.dart';
import 'package:school_app/utils/image_assets.dart';
import 'package:school_app/widgets/quiet_box.dart';

import '../../utils/shimmer_card.dart';
import 'student_controller.dart';

class StudentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              controller.localStorage.userName.toString().toUpperCase(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            actions: [
              Container(
                width: 39,
                height: 38,
                decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(50)),
                child: const Center(
                  child: Text(
                    'LOGO',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              )
            ],
          ),
          backgroundColor: ThemeColor.primary,
          body: SizedBox(
            height: Get.height,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Expanded(
                        child: ListView(
                      shrinkWrap: true,
                      children: [
                        const SizedBox(height: 30),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width - 64,
                          child: Center(
                            child: Text(
                              '${controller.homeController.className} std ${controller.sectionController.secName} section',
                              style: const TextStyle(fontSize: 32),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        controller.isLoading
                            ? Expanded(child: MainShimmerLoading())
                            : controller.studentModel.isEmpty
                                ? Expanded(
                                    child: QuietBox(
                                        title: "No Students", subTitle: ''))
                                : Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: ListView.separated(
                                        itemCount:
                                            controller.studentModel.length,
                                        shrinkWrap: true,
                                        separatorBuilder: (context, index) {
                                          return const Divider();
                                        },
                                        itemBuilder: (context, index) {
                                          return Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40),
                                                        color: Colors.black),
                                                    child: SvgPicture.asset(
                                                      SvgRes.noPhoto,
                                                      width: 24,
                                                      height: 24,
                                                    )),
                                                SizedBox(
                                                  width: Get.width / 1.8,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        controller
                                                            .studentModel[index]
                                                            .data
                                                            .name,
                                                        style: const TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                      const Text(
                                                        "no Data",
                                                        style: TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                  ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.black,
              mini: true,
              shape: const CircleBorder(),
              onPressed: () {},
              child: const Icon(Icons.add)),
        ),
      ),
    );
  }
}
