import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:school_app/utils/constant.dart';

import '../../widgets/snackbars.dart';

class AuthenticationAPI {
  final GetConnect connect = Get.find<GetConnect>();

  Future<dynamic> loginAPI(
      {required String email, required String password}) async {
    var body = jsonEncode({"email": email, "password": password});

    try {
      final http.Response response = await http.post(
        Uri.parse('$baseUrl$auth'),
        body: body,
        headers: {
          'Content-Type': 'application/json',
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
