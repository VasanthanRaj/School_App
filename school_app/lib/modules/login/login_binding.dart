import 'package:get/get.dart';
import 'package:school_app/modules/home/home_controller.dart';
import 'package:school_app/modules/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
