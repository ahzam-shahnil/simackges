import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:simackges/services/constants.dart';
import 'package:simackges/models/BasicCode.dart';
import 'package:simackges/services/HelperFunction.dart';

class OfferDrawerItems {
  Widget createHeader({
    required Color backColor,
    required String imgAddress,
    required String simTitle,
  }) {
    return Container(
      height: Get.height * 0.28,
      child: DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: Container(
          padding: EdgeInsets.only(top: 5),
          color: backColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Image.asset(
                  imgAddress,
                  height: Get.height * 0.12,
                  width: Get.width * 0.34,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                simTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: kOpenSans,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget createDrawerItem(
      {required int index,
      required GestureTapCallback onTap,
      required BasicCode basicCode}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(Icons.phone),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: AutoSizeText(
                HelperFunction.getBasicCodeTitle(index),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
