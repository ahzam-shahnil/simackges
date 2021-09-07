import 'package:auto_size_text/auto_size_text.dart';
import 'package:facebook_audience_network/ad/ad_banner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simackges/controller/FavColorController.dart';

import 'package:simackges/services/DbHelper.dart';
import 'package:simackges/services/HelperFunction.dart';
import 'package:simackges/services/constants.dart';
import 'package:simackges/models/Packages.dart';
import 'package:simackges/widgets/DetailsContainer.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({this.title, this.package, this.backColor});

  //* Variables declaration here
  final Color? backColor;
  final Packages? package;
  final String? title;

  //? Var declared here
  final DBHelper _dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        backgroundColor: backColor,
        title: Text(
          title!,
          style: kWhiteTextStyle,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Column(
          children: [
            Text(
              package!.name,
              style: TextStyle(
                fontFamily: kOpenSansBold,
                fontSize: width * 0.045,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 4,
            ),

            //? this row is for details tab
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DetailContainer(
                      width: width,
                      text: kOnNet,
                      value: package!.onnet,
                      unit: ' Mins',
                      backColor: backColor!,
                    ),
                    DetailContainer(
                      width: width,
                      text: kSMS,
                      value: package!.sms,
                      unit: ' Msgs',
                      backColor: backColor!,
                    ),
                    DetailContainer(
                      width: width,
                      text: kValidity,
                      value: package!.validity!.contains('.')
                          ? (double.tryParse(package!.validity!)! * 100)
                              .toInt()
                              .toString()
                          : package!.validity!,
                      unit: package!.validity!.contains('.') ? ' Hour' : ' Day',
                      backColor: backColor!,
                    ),
                    DetailContainer(
                      width: width,
                      text: kActivation,
                      value: package!.activate,
                      unit: '',
                      backColor: backColor!,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DetailContainer(
                      width: width,
                      text: kOffNet,
                      value: package!.offnet,
                      unit: ' Mins',
                      backColor: backColor!,
                    ),
                    DetailContainer(
                      width: width,
                      text: kInternet,
                      value: package!.mbs,
                      unit: ' MB',
                      backColor: backColor!,
                    ),
                    DetailContainer(
                      width: width,
                      text: kPrice,
                      value: package!.price,
                      unit: 'Rs',
                      backColor: backColor!,
                    ),
                    DetailContainer(
                      width: width,
                      text: kDeactivation,
                      value: package!.deactivate,
                      unit: '',
                      backColor: backColor!,
                    ),
                  ],
                ),
              ],
            ),

            //? Activate button starts here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Material(
                    child: InkWell(
                      onTap: () => HelperFunction.displayInstructionDialog(
                          context: context,
                          backColor: backColor!,
                          rechargeTitle: 'Confirmation',
                          package: package!),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.yellow,
                        ),
                        child: Text(
                          'Activate',
                          style: TextStyle(
                            color: backColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                //? favourite button implementaion starts here
                ClipOval(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(4),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () async {
                          await _dbHelper.insertFavourite(package!);
                        },
                        child: Obx(
                          () => Icon(
                            Icons.favorite_rounded,
                            color: Get.find<FavColorController>(tag: 'yes')
                                    .favColor
                                    .value
                                ? Colors.red
                                : Colors.white,
                            size: width * 0.1,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),

            //? details of package starts here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: AutoSizeText(
                    '${HelperFunction.formatDetails(package!.detail)}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: height * 0.021,
                      wordSpacing: height * 0.005,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
            const Spacer(),

            //? Banner Ad starts here
            Container(
              child: FacebookBannerAd(
                placementId: kOfferBannerFbAdId,
                bannerSize: BannerSize.STANDARD,
                listener: (result, value) {
                  switch (result) {
                    case BannerAdResult.ERROR:
                      print("Error: $value");
                      break;
                    case BannerAdResult.LOADED:
                      print("Loaded: $value");
                      break;
                    case BannerAdResult.CLICKED:
                      print("Clicked: $value");
                      break;
                    case BannerAdResult.LOGGING_IMPRESSION:
                      print("Logging Impression: $value");
                      break;
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
