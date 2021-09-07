import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  void snackBar({required String msg, Color? color}) {
    Get.snackbar('', '',
        snackPosition: SnackPosition.BOTTOM,
        messageText: Text(
          msg,
          style: TextStyle(
            fontSize: Get.size.width * 0.05,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        duration: const Duration(milliseconds: 1200),
        backgroundGradient: const LinearGradient(
            colors: [Colors.white, Colors.deepOrangeAccent, Colors.white]),
        padding: const EdgeInsets.all(15));
  }
}
