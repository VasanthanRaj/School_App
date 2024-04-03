import 'dart:convert';

import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:school_app/data/models/class_models.dart';
import 'package:school_app/data/providers/GetAPI.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/app_routes.dart';
import '../../utils/local_storage.dart';
import '../../widgets/network_error_item.dart';

class HomeController extends GetxController {

  //API
  final GetAPI getAPI = Get.find<GetAPI>();

  //Lists
  List<ClassesModel> classModel = <ClassesModel>[].obs;

  bool isLoading = false;

  @override
  void onInit() {
    fetchClasses();
    super.onInit();
  }

  Future<void> fetchClasses() async {
    isLoading = true;
    update();
    var results = await getAPI.classesAPI();
    if(results != null) {
      var convertResult = jsonDecode(results);
      print(convertResult);
      convertResult['posts'].forEach((result) => classModel.add(ClassesModel.fromJson(result)));
      isLoading = false;
      update();
    } else {
      isLoading = false;
      update();
    }
  }
}
