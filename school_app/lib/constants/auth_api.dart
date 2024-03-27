import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:school_app/utils/sharedPreferance.dart';

import 'constants.dart';


Future<String?> LoginApiCall(body, url, BuildContext context) async {

  try {
    final http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
      SnackBarHelper.showSnackBar(context, 'Login Success');
      return response.body;
    } else {
      print('Login failed: ${response.body}');
      SnackBarHelper.showSnackBar(context, response.body);
      return null;
    }
  } catch (e) {
    print('Exception occurred: $e');
    SnackBarHelper.showSnackBar(context, '$e');
    return null;
  }
}

Future<String?> GetApiCall(url, BuildContext context) async {

  String? token = await TokenManager.getToken();

  try {
    final http.Response response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
      // SnackBarHelper.showSnackBar(context, response.body.message)
      return response.body;
    } else {
      print('Login failed: ${response.body}');
      return null;
    }
  } catch (e) {
    print('Exception occurred: $e');
    return null;
  }
}