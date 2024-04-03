import 'package:get/get.dart';
import 'package:school_app/data/providers/GetAPI.dart';
import 'package:school_app/utils/local_storage.dart';

import '../data/providers/AuthenticationAPI.dart';
import '../services/network_status_service.dart';

class DependencyInjection {
  static void init() async {
    Get.put<GetConnect>(GetConnect());

    //local storage service
    Get.put<LocalStorage>(LocalStorage(), permanent: true);

    //providers
    Get.put<AuthenticationAPI>(AuthenticationAPI());
    Get.put<GetAPI>(GetAPI());

    //(creating issues in iOS so loading only for android)
    if(GetPlatform.isAndroid) {
      Get.put<NetworkStatusService>(NetworkStatusService(), permanent: true);
    }

  }
}
