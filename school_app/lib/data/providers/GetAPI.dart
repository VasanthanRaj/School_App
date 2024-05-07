import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:school_app/utils/constant.dart';
import 'package:school_app/utils/local_storage.dart';

import '../../widgets/snackbars.dart';

class GetAPI {
  final GetConnect connect = Get.find<GetConnect>();
  final LocalStorage localStorage = Get.find<LocalStorage>();

  Future<dynamic> userDetailsAPI() async {
    try {
      final http.Response response = await http.get(
        Uri.parse('$baseUrl$getUserDetails${localStorage.userId}'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${localStorage.token}',
        },
      );

      if (response.statusCode == 200) {
        print(response.body);
        var result = jsonDecode(response.body);
        return result;
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

  Future<dynamic> classesAPI() async {
    try {
      final http.Response response = await http.get(
        Uri.parse('$baseUrl$classDetails${localStorage.userId}?size=20'),
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

  Future<dynamic> sectionAPI({required classId}) async {
    try {
      final http.Response response = await http.get(
        Uri.parse('$baseUrl$sectionDetails${localStorage.userId}/$classId?size=10'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${localStorage.token}',
        },
      );

      if (response.statusCode == 200) {
        print(response.body);
        var result = jsonDecode(response.body);
        return result;
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

  Future<dynamic> studentAPI({required classId, required sectionId, required page, required size}) async {
    print("URL = ${'$baseUrl$studentsDetails${localStorage.userId}/$classId/$sectionId?size=$size&page=$page'} Page =  ${page}");
    try {
      final http.Response response = await http.get(
        Uri.parse('$baseUrl$studentsDetails${localStorage.userId}/$classId/$sectionId?size=$size&page=$page'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${localStorage.token}',
        },
      );

      if (response.statusCode == 200) {
        print("11111111111111111111111111111111");
        print(response.body);
        var result = jsonDecode(response.body);
        return result;
      } else {
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