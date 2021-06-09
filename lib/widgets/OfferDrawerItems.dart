import 'package:simackges/functions/constants.dart';
import 'package:simackges/models/BasicCode.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_fonts/google_fonts.dart';

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
              ClipOval(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: Get.height * 0.09,
                  child: Image.asset(
                    imgAddress,
                    height: Get.height * 0.12,
                    width: Get.width * 0.34,
                  ),
                ),
              ),
              Text(
                simTitle,
                style: GoogleFonts.openSans(color: Colors.white, fontSize: 18),
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
                getBasicCodeTitle(index),
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

  String getBasicCodeTitle(int index) {
    String title = '';
    switch (index) {
      case 0:
        title = kCheckBalanceText;
        break;
      case 1:
        title = kCheckSMS;
        break;
      case 2:
        title = kCheckMinutes;
        break;
      case 3:
        title = kCheckInternet;
        break;
      case 4:
        title = kCardRecharge;
        break;
      case 5:
        title = kGetLoan;
        break;
      case 6:
        title = kBalanceShare;
        break;
    }
    return title;
  }
}
