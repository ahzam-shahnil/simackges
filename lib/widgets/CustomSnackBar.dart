import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  void snackBar(String msg) {
    Get.snackbar('', '',
        snackPosition: SnackPosition.BOTTOM,
        messageText: Text(
          msg,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        duration: Duration(milliseconds: 1500),
        padding: EdgeInsets.all(15));
  }
}
