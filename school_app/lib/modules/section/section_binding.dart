import 'package:get/get.dart';
import 'package:school_app/modules/section/section_controller.dart';

class SectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SectionController());
  }
}
