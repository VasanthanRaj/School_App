import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_app/data/models/student_model.dart';
import 'package:school_app/data/providers/GetAPI.dart';
import 'package:school_app/modules/home/home_controller.dart';
import 'package:school_app/modules/section/section_controller.dart';

import '../../utils/local_storage.dart';

class StudentController extends GetxController {
  //API
  final GetAPI getAPI = Get.find<GetAPI>();

  //dependency injection
  final HomeController homeController = Get.find<HomeController>();
  final SectionController sectionController = Get.find<SectionController>();

  //Local Storage
  final LocalStorage localStorage = Get.find<LocalStorage>();

  //Lists
  List<StudentModel> studentModel = <StudentModel>[].obs;

  //controllers
  ScrollController scrollController = ScrollController();

  //pagination integers
  int page = 1;
  int limit = 10;

  bool isLoading = false;

  //files
  File? imagefile;
  final ImagePicker picker = ImagePicker();
  XFile? imageFilePath;

  @override
  void onInit() {
    fetchStudent();
    fetchMoreStudent();
    super.onInit();
  }

  Future<void> fetchStudent() async {
    isLoading = true;
    update();
    var results = await getAPI.studentAPI(
        classId: homeController.classId.value,
        sectionId: sectionController.secId.value,
        page: page,
        size: limit);
    if (results != null) {
      print("##########################");
      print(results);
      results['posts']
          .forEach((result) => studentModel.add(StudentModel.fromJson(result)));
      isLoading = false;
      update();
    } else {
      isLoading = false;
      update();
    }
  }

  void fetchMoreStudent() async {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        page = page + 1;
        update();
        var results = await getAPI.studentAPI(
          page: page,
          size: limit,
          classId: homeController.classId.value,
          sectionId: sectionController.secId.value,
        );
        print("************************************" + "PAges Updated = ${page}");
        print(results);
        if (results != null && !results.isEmpty) {
          results['posts'].forEach(
            (result) => studentModel.add(StudentModel.fromJson(result)),
          );
        }
      }
    });
  }

  getFromGallery() async {
    final XFile? selectedImages =
        await picker.pickImage(source: ImageSource.gallery);
    if (selectedImages!.isBlank != true) {
      print(selectedImages);
      // imageFileList!.addAll(selectedImages);
    }
    // isImageIconVisible = true;
    // galleryImage = true;
    update();
  }

  getFromCamera() async {
    // Pick an image
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    imageFilePath = image;
    if (imageFilePath.isBlank != true) {
      print(image!);
      // imageFileList?.add(image!);
    }
    // isImageIconVisible = true;
    // galleryImage = false;
    update();
  }
}
