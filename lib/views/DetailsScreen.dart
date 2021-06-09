import 'package:auto_size_text/auto_size_text.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:facebook_audience_network/ad/ad_banner.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:simackges/functions/DbHelper.dart';
import 'package:simackges/functions/HelperFunction.dart';
import 'package:simackges/functions/constants.dart';
import 'package:simackges/models/Packages.dart';
import 'package:simackges/widgets/DetailsContainer.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen(
      {required this.title, required this.package, required this.backColor});

  //* Variables declaration here
  final Color backColor;
  final Packages package;
  final String title;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final DBHelper _dbHelper = DBHelper();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: widget.backColor,
      appBar: AppBar(
        backgroundColor: widget.backColor,
        title: Text(
          widget.title,
          style: kWhiteTextStyle,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Column(
          children: [
            Text(
              widget.package.name,
              style: GoogleFonts.openSans(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20,
            ),

            //? this row is for details tab
            Row(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DetailContainer(
                      width: width,
                      text: kOnNet,
                      value: widget.package.onnet,
                      unit: ' Mins',
                      backColor: widget.backColor,
                    ),
                    DetailContainer(
                      width: width,
                      text: kSMS,
                      value: widget.package.sms,
                      unit: ' Msgs',
                      backColor: widget.backColor,
                    ),
                    DetailContainer(
                      width: width,
                      text: kValidity,
                      value: widget.package.validity!.contains('.')
                          ? (double.tryParse(widget.package.validity!)! * 100)
                              .toInt()
                              .toString()
                          : widget.package.validity!,
                      unit: widget.package.validity!.contains('.')
                          ? ' Hour'
                          : ' Day',
                      backColor: widget.backColor,
                    ),
                    DetailContainer(
                      width: width,
                      text: kActivation,
                      value: widget.package.activate,
                      unit: '',
                      backColor: widget.backColor,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DetailContainer(
                      width: width,
                      text: kOffNet,
                      value: widget.package.offnet,
                      unit: ' Mins',
                      backColor: widget.backColor,
                    ),
                    DetailContainer(
                      width: width,
                      text: kInternet,
                      value: widget.package.mbs,
                      unit: ' MB',
                      backColor: widget.backColor,
                    ),
                    DetailContainer(
                      width: width,
                      text: kPrice,
                      value: widget.package.price,
                      unit: 'Rs',
                      backColor: widget.backColor,
                    ),
                    DetailContainer(
                      width: width,
                      text: kDeactivation,
                      value: widget.package.deactivate,
                      unit: '',
                      backColor: widget.backColor,
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
                  padding: EdgeInsets.symmetric(
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
                          backColor: widget.backColor,
                          rechargeTitle: 'Confirmation',
                          package: widget.package),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.yellow,
                        ),
                        child: Text(
                          'Activate',
                          style: TextStyle(
                            color: widget.backColor,
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
                    padding: EdgeInsets.all(4),
                    child: Material(
                      color: Colors.white.withOpacity(0.0),
                      child: InkWell(
                        onTap: () async {
                          await _dbHelper.insertFavourite(widget.package);
                        },
                        child: Icon(
                          Icons.favorite_border_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),

            //? details of package starts here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: AutoSizeText(
                    '${HelperFunction.formatDetails(widget.package.detail)}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
            Spacer(),

            //? Banner Ad starts here
            Container(
              alignment: Alignment(0.5, 1),
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
