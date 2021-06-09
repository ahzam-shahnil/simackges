import 'dart:async';

// ignore: import_of_legacy_library_into_null_safe
import 'package:facebook_audience_network/ad/ad_interstitial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:simackges/models/Packages.dart';

import 'constants.dart';

class HelperFunction {
  static String formatDetails(String value) {
    value = value.replaceAll("\\n", '.\n');
    return value;
  }

  static String getSimPic(String pic) {
    String title = '';
    switch (pic) {
      case 'jazzlogo':
        title = kJazzImgAddress;
        break;
      case 'jazzdevice':
        title = kJazzDeviceAddress;
        break;
      case 'jnetsim':
        title = kJazzNetSimAddress;
        break;
      case 'jpostpay':
        title = kJazzPostPayAddress;
        break;
      case 'uprepay':
        title = kUfonePrePayAddress;
        break;
      case 'upostpay':
        title = kUfonePostPayAddress;
        break;
      case 'uth':
        title = kUthAddress;
        break;
      case 'telenorlogo':
        title = kTelenorImgAddress;
        break;
      case 'tpostpay':
        title = kTelenorPostPayAddress;
        break;
      case 'tbroad':
        title = kTelenorBroadAddress;
        break;
      case 'tnetsim':
        title = kTelenorNetSimAddress;
        break;
      case 'zonglogo':
        title = kZongImgAddress;
        break;
      case 'zbroad':
        title = kZongBroadAddress;
        break;
      case 'zpostpay':
        title = kZongPostPayAddress;
        break;
      case 'znetsim':
        title = kZongNetSimAddress;
        break;
      case 'ptclbroad':
        title = kPtclBroadAddress;
        break;
      case 'ptclevo9_3':
        title = kPtclEvoAddress;
        break;
      case 'ptclcarfi':
        title = kPtclCarfiAddress;
        break;
      case 'ptclnitro':
        title = kPtclNitroAddress;
        break;
      case 'ptclcharji':
        title = kPtclCharjiAddress;
        break;
      case 'ptcltel':
        title = kPtclPhoneAddress;
        break;
      case 'ptcltv':
        title = kPtclTvAddress;
        break;
    }
    return title;
  }

  static launchSmS({required String code, required String bodyMsg}) async {
    String url = 'sms:$code?body=$bodyMsg';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> displayInstructionDialog({
    required BuildContext context,
    required Color backColor,
    required String rechargeTitle,
    required Packages package,
  }) async {
    //Style for text button
    var textButtonStyle =
        TextButton.styleFrom(primary: backColor, backgroundColor: Colors.white);
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text(
              '$rechargeTitle ',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: backColor,
            content: SingleChildScrollView(
              child: Text(
                kConfirmText,
                style: kWhiteTextStyle,
              ),
            ),
            actions: <Widget>[
              TextButton(
                  style: textButtonStyle,
                  child: Text('No'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              TextButton(
                style: textButtonStyle,
                child: Text('Yes'),
                onPressed: () {
                  package.send == null
                      ? package.activate == null
                          ? showToast(
                              kErrorText,
                              context: context,
                              animation: StyledToastAnimation.scale,
                            )
                          : HelperFunction.launchPhone(package.activate!)
                      : package.activate == null
                          ? //Set an animation
                          showToast(
                              kErrorText,
                              context: context,
                              animation: StyledToastAnimation.scale,
                            )
                          : HelperFunction.launchSmS(
                              code: package.activate!, bodyMsg: package.send!);
                  Get.back();
                  //? Interstital Ad here
                  FacebookInterstitialAd.loadInterstitialAd(
                    placementId: kInterstDetailFbAdId,
                    listener: (result, value) {
                      if (result == InterstitialAdResult.LOADED)
                        FacebookInterstitialAd.showInterstitialAd(delay: 5000);
                    },
                  );
                },
              ),
            ],
          );
        });
  }

  static launchPhone(String code) async {
    String url = 'tel:$code';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static launchURl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
