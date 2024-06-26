import 'dart:convert';

import 'package:get/get.dart';
import 'package:school_app/data/models/class_models.dart';
import 'package:school_app/data/providers/GetAPI.dart';

import '../../routes/app_routes.dart';
import '../../utils/local_storage.dart';

class HomeController extends GetxController {
  //API
  final GetAPI getAPI = Get.find<GetAPI>();

  //Local Storage
  final LocalStorage localStorage = Get.find<LocalStorage>();

  //Lists
  List<ClassesModel> classModel = <ClassesModel>[].obs;

  RxInt classId = 0.obs;
  RxString className = ''.obs;

  bool isLoading = false;

  @override
  void onInit() {
    fetchClasses();
    print(localStorage);
    super.onInit();
  }

  Future<void> fetchClasses() async {
    isLoading = true;
    update();
    var results = await getAPI.classesAPI();
    if (results != null) {
      var convertResult = jsonDecode(results);
      print(convertResult);
      convertResult['posts']
          .forEach((result) => classModel.add(ClassesModel.fromJson(result)));
      isLoading = false;
      update();
    } else {
      isLoading = false;
      update();
    }
  }

  void sectionNav({required int index}) {
    classId = RxInt(classModel[index].id);
    className = RxString(classModel[index].name);
    update();
    Get.toNamed(AppRoutes.section);
  }
}
