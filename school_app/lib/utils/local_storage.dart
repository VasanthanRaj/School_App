import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage extends GetxService {
  RxString token = ''.obs;
  RxString userId = ''.obs;
  RxString classId = ''.obs;
  RxString sectionId = ''.obs;
  RxString userName = ''.obs;
  RxString email = ''.obs;
  RxString image = ''.obs;
  RxString phoneNumber = ''.obs;
  RxString address = ''.obs;
  RxString webUrl = ''.obs;

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
    userName = RxString(preferences.getString('userName') ?? '');
    email = RxString(preferences.getString('email') ?? '');
    phoneNumber = RxString(preferences.getString('phoneNumber') ?? '');
    image = RxString(preferences.getString('image') ?? '');
    address = RxString(preferences.getString('address') ?? '');
    webUrl = RxString(preferences.getString('webUrl') ?? '');
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

  setuserDetails({
    required String userNameLocal,
    required String emailLocal,
    required String imageLocal,
    required String phoneNumberLocal,
    required String addressLocal,
    required String webUrlLocal,
}) {
    userName = RxString(userNameLocal);
    email = RxString(emailLocal);
    image = RxString(imageLocal);
    phoneNumber = RxString(phoneNumberLocal);
    address = RxString(addressLocal);
    webUrl = RxString(webUrlLocal);
  }
}
