import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/utils/local_storage.dart';

PreferredSizeWidget AppBarWidget() {

  final LocalStorage localStorage = Get.find<LocalStorage>();

  return AppBar(
    centerTitle: true,
    title: Text(
      localStorage.userName.toString().toUpperCase(),
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    ),
    actions: [
      Container(
        width: 39,
        height: 38,
        decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(50)),
        child: const Center(
          child: Text(
            'LOGO',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
        ),
      ),
      const SizedBox(
        width: 20,
      )
    ],
  );
}