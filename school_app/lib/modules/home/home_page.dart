import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:school_app/themes/colors_theme.dart';
import 'package:school_app/utils/image_assets.dart';

import '../../utils/shimmer_card.dart';
import '../../widgets/quiet_box.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              controller.localStorage.userName.toString().toUpperCase(),
              // controller.classModel[0].user.label.toUpperCase(),
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
          body: Padding(
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
                          "Standard",
                          style: TextStyle(fontSize: 32),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    controller.isLoading
                        ? MainShimmerLoading()
                        : controller.classModel.isEmpty
                            ? QuietBox(title: "No Standards", subTitle: '')
                            : GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.classModel.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, // Three columns
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 50,
                                ),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      print(controller
                                          .classModel[
                                              controller.classModel.length -
                                                  index -
                                                  1]
                                          .id);
                                      controller.sectionNav(
                                          index: controller.classModel.length -
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
                                              SvgPicture.asset(SvgRes.close,
                                                  height: 11, width: 11),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 79,
                                            child: Center(
                                              child: Text(
                                                controller
                                                        .classModel[controller
                                                                .classModel
                                                                .length -
                                                            index -
                                                            1]
                                                        .name +
                                                    ' Std',
                                                style: const TextStyle(
                                                    fontSize: 24),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                )),
                ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      minimumSize:
                          MaterialStateProperty.all(const Size(240, 47.0)),
                    ),
                    onPressed: () async {},
                    child: const Text(
                      "Delete Bulk Upload",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    )),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.black,
              mini: true,
              shape: const CircleBorder(),
              onPressed: () {},
              child: Icon(Icons.add)),
        ),
      ),
    );
  }
}
