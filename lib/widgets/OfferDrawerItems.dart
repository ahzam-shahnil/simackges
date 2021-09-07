import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:simackges/models/BasicCode.dart';
import 'package:simackges/services/HelperFunction.dart';
import 'package:simackges/services/constants.dart';

class OfferDrawerItem extends StatelessWidget {
  const OfferDrawerItem({
    Key? key,
    required this.index,
    required this.onTap,
    required this.basicCode,
  }) : super(key: key);
  final int index;
  final GestureTapCallback onTap;
  final BasicCode basicCode;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: <Widget>[
          const Icon(Icons.phone),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
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

class OfferDrawerHeader extends StatelessWidget {
  const OfferDrawerHeader({
    Key? key,
    required this.backColor,
    required this.imgAddress,
    required this.simTitle,
  }) : super(key: key);
  final Color backColor;
  final String imgAddress;
  final String simTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.28,
      child: DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: Container(
          padding: const EdgeInsets.only(top: 5),
          color: backColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: const Radius.circular(40),
                      topLeft: const Radius.circular(40),
                      topRight: const Radius.circular(40),
                    )),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Image.asset(
                  imgAddress,
                  height: Get.height * 0.12,
                  width: Get.width * 0.34,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                simTitle,
                style: const TextStyle(
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
}
