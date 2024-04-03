import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:school_app/utils/constant.dart';
import 'package:school_app/utils/local_storage.dart';

import '../../widgets/snackbars.dart';

class GetAPI {
  final GetConnect connect = Get.find<GetConnect>();
  final LocalStorage localStorage = Get.find<LocalStorage>();

  Future<dynamic> classesAPI() async {
    try {
      final http.Response response = await http.get(
        Uri.parse('$baseUrl$classIndex${localStorage.userId}?size=20'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${localStorage.token}',
        },
      );

      if (response.statusCode == 200) {
        print(response.body);
        return response.body;
      } else {
        print('Login failed: ${response.body}');
        SnackNotification.error(
          message: response.body,
        );
        return null;
      }
    } catch (e) {
      print('Exception occurred: $e');
      SnackNotification.error(
        message: e,
      );
      return null;
    }
  }
}