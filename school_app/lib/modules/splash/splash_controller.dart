import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/app_routes.dart';
import '../../utils/local_storage.dart';
import '../../widgets/network_error_item.dart';

class SplashController extends GetxController {

  final LocalStorage localStorage = Get.find<LocalStorage>();

  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(
        const Duration(seconds: 4), () => checkInternetConnectivity());
  }

  void validateUser() async {
    validateJwtToken();
  }

  //Internet(Wifi or mobile) checking
  void checkInternetConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      validateUser();
    } else {
      Get.dialog(NetworkErrorItem(), useSafeArea: false);
    }
  }

  //validate JWT Token expiration
  void validateJwtToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = localStorage.token.toString();

    if (token.isNotEmpty) {
      print("Enter ID");
      bool hasExpired = JwtDecoder.isExpired(token);
      if (!hasExpired) {
        Get.offNamed(AppRoutes.home);
      } else {
        preferences.clear();
        Get.offNamed(AppRoutes.login);
      }
    } else {
      print("No Enter ID");
      Get.offNamed(AppRoutes.login);
    }
  }
}
