import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school_app/modules/students/student_controller.dart';
import 'package:school_app/themes/colors_theme.dart';
import 'package:school_app/widgets/appBar.dart';

import '../../../utils/image_assets.dart';

class StudentCard extends StatelessWidget {
  final int index;

  StudentCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentController>(
        builder: (controller) => SafeArea(
                child: (Scaffold(
              appBar: AppBarWidget(),
              backgroundColor: ThemeColor.primary,
              body: SizedBox(
                height: Get.height,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Get.width / 1.5,
                        child: Column(
                          children: [
                            Bage("Name:",
                                controller.studentModel[index].data.name),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Bage("STD:",
                                    "${controller.studentModel[index].classId.label}"),
                                const SizedBox(width: 30),
                                Bage("SEC:",
                                    "${controller.studentModel[index].sectionName}"),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Bage("DOB:",
                                controller.studentModel[index].data.dob),
                            const SizedBox(height: 5),
                            Container(
                              width: Get.width / 1.4,
                              child: Bage("Address:", ""),
                            ),
                            const SizedBox(height: 5),
                            Bage("Mob no:",
                                controller.studentModel[index].data.contact),
                          ],
                        ),
                      ),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          controller.studentModel[index].imagePath != ''
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(70),
                                  child: Image.network(
                                    controller.studentModel[index].imagePath,
                                    fit: BoxFit.cover,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        debugPrint('image loading null');
                                        return child;
                                      }
                                      debugPrint('image loading...');
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    },
                                    width: 75,
                                    height: 75,
                                  ),
                                )
                              : Container(
                                  width: 75,
                                  height: 75,
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(70),
                                  ),
                                  child: SvgPicture.asset(
                                    SvgRes.noPhoto,
                                    width: 10,
                                    height: 10,
                                  )),
                          InkWell(
                            onTap: () => {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      scrollable: true,
                                      title: Text(
                                        'Add photo',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      content: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Form(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              Column(
                                                children: [
                                                  Semantics(
                                                    label: 'Camera',
                                                    child: FloatingActionButton(
                                                      elevation: 2,
                                                      onPressed: () {
                                                        controller
                                                            .getFromCamera();
                                                        Get.back();
                                                      },
                                                      tooltip:
                                                          'Take a picture from camera',
                                                      child: Icon(
                                                        Icons.camera_alt,
                                                        color: ThemeColor.white,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    'Camera',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                              Column(children: [
                                                Semantics(
                                                  label: 'Gallery',
                                                  child: FloatingActionButton(
                                                    elevation: 2,
                                                    onPressed: () {
                                                      controller
                                                          .getFromGallery();
                                                      Get.back();
                                                    },
                                                    tooltip:
                                                        'Pick an image form gallery',
                                                    child: const Icon(
                                                      Icons.photo,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  'Gallery',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                            },
                            child: Container(
                                alignment: Alignment.center,
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Icon(
                                  Icons.add,
                                  size: 15,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ))));
  }

  Widget Bage(String title, String data) {
    return Row(
      children: [BageTitle(title), const SizedBox(width: 5), BageData(data)],
    );
  }

  Widget BageTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: ThemeColor.white),
    );
  }

  Widget BageData(String title) {
    return Text(
      title,
      overflow: TextOverflow.clip,
      style: const TextStyle(fontSize: 16, color: ThemeColor.white),
    );
  }
}
