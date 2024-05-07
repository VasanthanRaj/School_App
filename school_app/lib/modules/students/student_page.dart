import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:school_app/modules/students/widget/student_card.dart';
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
              child: Container(
                height: Get.height - 50,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width - 64,
                      child: Center(
                        child: Text(
                          '${controller.homeController.className} std ${controller.sectionController.secName} section',
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: ThemeColor.white),
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
                                height: Get.height - 162,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: ListView.separated(
                                    controller: controller.scrollController,
                                    itemCount: controller.studentModel.length,
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    separatorBuilder: (context, index) {
                                      return const Divider();
                                    },
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () => {
                                          Get.dialog(StudentCard(index: index)),
                                          print(index)
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              controller.studentModel[index]
                                                          .imagePath !=
                                                      ''
                                                  ? ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      child: Image.network(
                                                        controller
                                                            .studentModel[index]
                                                            .imagePath,
                                                        fit: BoxFit.cover,
                                                        loadingBuilder: (context,
                                                            child,
                                                            loadingProgress) {
                                                          if (loadingProgress ==
                                                              null) {
                                                            debugPrint(
                                                                'image loading null');
                                                            return child;
                                                          }
                                                          debugPrint(
                                                              'image loading...');
                                                          return const Center(
                                                              child:
                                                                  CircularProgressIndicator());
                                                        },
                                                        width: 40,
                                                        height: 40,
                                                      ),
                                                    )
                                                  : Container(
                                                      width: 40,
                                                      height: 40,
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(40),
                                                          color: Colors.black),
                                                      child: SvgPicture.asset(
                                                        SvgRes.noPhoto,
                                                        width: 10,
                                                        height: 10,
                                                      )),
                                              SizedBox(
                                                width: Get.width / 1.8,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      controller
                                                          .studentModel[index]
                                                          .data
                                                          .name,
                                                      style: const TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                    Text(
                                                      controller
                                                          .studentModel[index]
                                                          .data
                                                          .roleNo,
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
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
