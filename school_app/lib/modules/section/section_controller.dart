import 'package:get/get.dart';
import 'package:school_app/data/models/section_model.dart';
import 'package:school_app/data/providers/GetAPI.dart';
import 'package:school_app/modules/home/home_controller.dart';

import '../../routes/app_routes.dart';
import '../../utils/local_storage.dart';

class SectionController extends GetxController {

  //API
  final GetAPI getAPI = Get.find<GetAPI>();

  //dependency injection
  final HomeController homeController = Get.find<HomeController>();

  //Local Storage
  final LocalStorage localStorage = Get.find<LocalStorage>();

  //Lists
  List<SectionModel> sectionModel = <SectionModel>[].obs;

  RxInt secId = 0.obs;
  RxString secName = ''.obs;

  bool isLoading = false;

  bool isEdit = false;

  @override
  void onInit() {
    fetchSection();
    super.onInit();
  }

  Future<void> fetchSection() async {
    isLoading = true;
    update();
    var results = await getAPI.sectionAPI(classId: homeController.classId.value);
    if(results != null) {
      print("##########################");
      print(results);
      results['posts'].forEach((result) => sectionModel.add(SectionModel.fromJson(result)));
      isLoading = false;
      update();
    } else {
      isLoading = false;
      update();
    }
  }

  void studentNav({required int index}) {
    secId = RxInt(sectionModel[index].id);
    secName = RxString(sectionModel[index].name);
    update();
    Get.toNamed(AppRoutes.students);
  }
}
