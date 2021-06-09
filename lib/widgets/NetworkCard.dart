import 'package:flutter/material.dart';

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
        padding: EdgeInsets.all(10),
        child: InkWell(
          child: image,
          onTap: onTap,
        ),
      ),
    );
  }
}
