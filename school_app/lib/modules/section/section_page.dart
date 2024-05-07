import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:school_app/themes/colors_theme.dart';
import 'package:school_app/utils/image_assets.dart';
import 'package:school_app/widgets/appBar.dart';

import '../../utils/shimmer_card.dart';
import '../../widgets/quiet_box.dart';
import 'section_controller.dart';

class SectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SectionController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          appBar: AppBarWidget(),
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
                          child: const Center(
                            child: Text(
                              "Sections",
                              style: TextStyle(
                                  fontSize: 32,
                                  color: ThemeColor.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        controller.isLoading
                            ? MainShimmerLoading()
                            : controller.sectionModel.isEmpty
                                ? QuietBox(title: "No Section", subTitle: '')
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: GridView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount:
                                            controller.sectionModel.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2, // Three columns
                                          crossAxisSpacing: 50,
                                          mainAxisSpacing: 50,
                                        ),
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              controller.studentNav(
                                                  index: controller
                                                          .sectionModel.length -
                                                      index -
                                                      1);
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: ThemeColor.white,
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              width: 105,
                                              height: 105,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      SvgPicture.asset(
                                                          SvgRes.editPencil,
                                                          height: 15,
                                                          width: 15),
                                                      const SizedBox(width: 5),
                                                      SvgPicture.asset(
                                                          SvgRes.close,
                                                          height: 11,
                                                          width: 11),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 79,
                                                    child: Center(
                                                      child: Text(
                                                        controller
                                                            .sectionModel[controller
                                                                    .sectionModel
                                                                    .length -
                                                                index -
                                                                1]
                                                            .name,
                                                        style: const TextStyle(
                                                            fontSize: 40,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    )),
                    if (controller.isEdit)
                      ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Adjust the radius as needed
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            minimumSize:
                                MaterialStateProperty.all(const Size(30, 47.0)),
                          ),
                          onPressed: () async {},
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                                fontSize: 24,
                                color: ThemeColor.primary,
                                fontWeight: FontWeight.w500),
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
              backgroundColor: Colors.white,
              mini: true,
              shape: const CircleBorder(),
              onPressed: () {},
              child: const Icon(
                Icons.add,
                color: ThemeColor.primary,
              )),
        ),
      ),
    );
  }
}
