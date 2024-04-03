import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage extends GetxService {
  RxString token = ''.obs;
  RxString userId = ''.obs;
  RxString classId = ''.obs;
  RxString sectionId = ''.obs;

  @override
  void onInit() {
    fetchLocalUserDetails();
    super.onInit();
  }

  void fetchLocalUserDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token = RxString(preferences.getString('token') ?? '');
    userId = RxString(preferences.getString('userId') ?? '');
    classId = RxString(preferences.getString('classId') ?? '');
    sectionId = RxString(preferences.getString('sectionId') ?? '');
  }

  setClassData({
    required String classLocal,
  }) {
    classId = RxString(classLocal);
  }

  setSectionData({
    required String sectionLocal,
  }) {
    sectionId = RxString(sectionLocal);
  }

  setLocalData({
    required String tokenLocal,
    required String userIdLocal,
  }) {
    token = RxString(tokenLocal);
    userId = RxString(userIdLocal);
  }
}
