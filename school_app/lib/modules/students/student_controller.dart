import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:school_app/data/models/class_models.dart';
import 'package:school_app/data/models/section_model.dart';
import 'package:school_app/data/models/student_model.dart';
import 'package:school_app/data/providers/GetAPI.dart';
import 'package:school_app/modules/home/home_controller.dart';
import 'package:school_app/modules/section/section_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/app_routes.dart';
import '../../utils/local_storage.dart';
import '../../widgets/network_error_item.dart';

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
        page = page++;
        update();
        var results = await getAPI.studentAPI(
          page: page,
          size: limit,
          classId: homeController.classId.value,
          sectionId: sectionController.secId.value,
        );
        if (results != null && !results.isEmpty) {
          results.forEach(
            (result) => studentModel.add(StudentModel.fromJson(result)),
          );
        }
      }
    });
  }
}
