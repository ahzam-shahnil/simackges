import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkCard extends StatelessWidget {
  const NetworkCard({
    Key? key, required this.image, required this.onTap,
  }) : super(key: key);
final Image image; final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color:const Color(0xFFe6e6e6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: Get.size.width * 0.42,
        height: Get.size.height * 0.16,
        padding: const EdgeInsets.all(10),
        child: InkWell(
          child: image,
          onTap: onTap,
        ),
      ),
    );
  }
}
