import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:school_app/themes/colors_theme.dart';
import 'package:school_app/utils/image_assets.dart';

import '../../utils/shimmer_card.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: controller.isLoading ? AppbarShimmerLoading() : Text(
                controller.classModel[0].user.label.toUpperCase(),
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
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(height: 100),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width - 64,
                          child: const Center(
                            child: Text(
                              "Standard",
                              style: TextStyle(fontSize: 32),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {},
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    if (controller.isLoading) MainShimmerLoading(),
                    if (!controller.isLoading)
                      GridView.builder(
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
                            return Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: ThemeColor.white,
                                  borderRadius: BorderRadius.circular(8)),
                              width: 105,
                              height: 105,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SvgPicture.asset(SvgRes.editPencil,
                                          height: 15, width: 15),
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
                                                        .classModel.length -
                                                    index -
                                                    1]
                                                .name +
                                            ' Std',
                                        style: const TextStyle(fontSize: 24),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                          style:
                              TextStyle(fontSize: 24, color: Colors.white),
                        )),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
