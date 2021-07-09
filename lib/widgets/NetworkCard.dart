import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkCard {
  Widget getNetworkCard(
      {required Image image, required GestureTapCallback onTap}) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: Color(0xFFe6e6e6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: Get.size.width * 0.42,
        height: Get.size.height * 0.16,
        padding: EdgeInsets.all(10),
        child: InkWell(
          child: image,
          onTap: onTap,
        ),
      ),
    );
  }
}
