import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';
import '../widgets/network_error_item.dart';

class NetworkStatusService extends GetxService {
  NetworkStatusService() {
    Connectivity().onConnectivityChanged.listen(
          (status) async {
        _getNetworkStatus(status);
      },
    );
  }

  void _getNetworkStatus(ConnectivityResult status) {
    if (status == ConnectivityResult.mobile ||
        status == ConnectivityResult.wifi) {
      if (Get.isDialogOpen == true) {
        Get.offNamedUntil(AppRoutes.splash, (_) => false);
      }
    } else {
      Get.dialog(NetworkErrorItem(), useSafeArea: false);
    }
  }
}
