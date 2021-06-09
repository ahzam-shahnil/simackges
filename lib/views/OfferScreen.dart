// ignore: import_of_legacy_library_into_null_safe
import 'package:facebook_audience_network/ad/ad_banner.dart';
import 'package:simackges/functions/DbHelper.dart';
import 'package:simackges/functions/HelperFunction.dart';
import 'package:simackges/functions/constants.dart';
import 'package:simackges/models/BasicCode.dart';
import 'package:simackges/models/Offers.dart';
import 'package:simackges/views/PackageScreen.dart';
import 'package:simackges/widgets/CustomTextField.dart';
import 'package:simackges/widgets/OfferDrawerItems.dart';
import 'package:simackges/widgets/offerIcon.dart';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:url_launcher/url_launcher.dart';

class OfferScreen extends StatefulWidget {
  OfferScreen({
    required this.networkId,
    required this.simTitle,
    required this.backColor,
    required this.imgAddress,
  });

  final Color backColor;
  final String imgAddress;
  final int networkId;
  final String simTitle;

  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  //Var declaration
  List<BasicCode> basicCodeList = [];
  List<Offers> offersList = [];
  late TextEditingController _cardRechargeController;
  late TextEditingController _balanceShareController;
  final DBHelper _dbHelper = DBHelper();
  // custom widget classes for icon and drawer
  OfferIcon offerIcon = OfferIcon();
  OfferDrawerItems offerDrawer = OfferDrawerItems();

  // // Banner Ad
  // BannerAd? bannerAd;
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   final adstate = Provider.of<AdState>(context);
  //   adstate.initialization.then((value) => setState(() {
  //         bannerAd = BannerAd(
  //           size: AdSize.smartBanner,
  //           adUnitId: adstate.bannerAdUnitId,
  //           listener: AdState.adListener,
  //           request: AdRequest(),
  //         )..load();
  //       }));
  // }

  @override
  void initState() {
    _cardRechargeController = TextEditingController();
    _balanceShareController = TextEditingController();

    super.initState();
  }

  _launchURL(String code) async {
    String url = code != kUfoneRSmsCode ? 'tel:$code' : 'sms:$code';
    if (code == kUfoneRSmsCode) {
      await _displayRechargeDialog(
        context: context,
        code: code,
      );
    }

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  //getter for Recharge Dialog title
  String get rechargeTitle {
    String title = '';
    switch (widget.networkId) {
      case 1:
        title = kJazzCardR;
        break;
      case 2:
        title = kUfoneCardR;
        break;
      case 3:
        title = kTelenorCardR;
        break;
      case 4:
        title = kZongCardR;
        break;
    }
    return title;
  }

  Future<void> _displayRechargeDialog(
      {required BuildContext context, required String code}) async {
    //Style for text button
    var textButtonStyle = TextButton.styleFrom(
        primary: widget.backColor, backgroundColor: Colors.white);
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text(
              '$rechargeTitle Card Recharge',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: widget.backColor,
            content: SingleChildScrollView(
              child: CustomTextField(
                textController: _cardRechargeController,
                hintText: kCardRechargeHint,
                maxLength: 14,
              ),
            ),
            actions: <Widget>[
              TextButton(
                style: textButtonStyle,
                child: Text('CANCEL'),
                onPressed: () {
                  _cardRechargeController.clear();
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text('OK'),
                style: textButtonStyle,
                onPressed: () {
                  _cardRechargeController.text.length == 14
                      ? _launchURL(code + _cardRechargeController.text + '#')
                      : print('');
                },
              ),
            ],
          );
        });
  }

  Future<void> _displayBalanceShareDialog(
      {required BuildContext context, required String code}) async {
    //Style for text button
    var textButtonStyle = TextButton.styleFrom(
        primary: widget.backColor, backgroundColor: Colors.white);
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text(
              '$rechargeTitle Balance Share',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: widget.backColor,
            content: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextField(
                      textController: _cardRechargeController,
                      hintText: kShareBalanceHint,
                      maxLength: 11),
                  CustomTextField(
                      textController: _balanceShareController,
                      hintText: kBalanceAmountHint,
                      maxLength: 3),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                style: textButtonStyle,
                child: Text('CANCEL'),
                onPressed: () {
                  _balanceShareController.clear();
                  _cardRechargeController.clear();
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text('OK'),
                style: textButtonStyle,
                onPressed: () {
                  if (code == kUfoneShareCode) {
                    if (_cardRechargeController.text.length == 11 &&
                        int.parse(_balanceShareController.text) >= 15) {
                      //* SMS launcher implementation
                      HelperFunction.launchSmS(
                          bodyMsg: _cardRechargeController.text +
                              'U2U' +
                              _balanceShareController.text,
                          code: code);
                    }
                  } else {
                    _cardRechargeController.text.length == 14
                        ? _launchURL(code + _cardRechargeController.text + '#')
                        : print('');
                  }
                },
              ),
            ],
          );
        });
  }

  //? Screen Ui implemented here
  @override
  Widget build(BuildContext context) {
    //? getting height of device screen
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: buildDrawer(),
      appBar: AppBar(
        title: Text(widget.simTitle + 'Offers'),
        backgroundColor: widget.backColor,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border_rounded),
            //? Todo implement favourite class here
            onPressed: () => Get.to(
              () => PackageScreen(
                title: widget.simTitle + kFavouriteText,
                backColor: widget.backColor,
                network: widget.networkId,
                isFavourite: true,
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: height * 0.03,
                ),
                Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    kDesignImgAddress,
                    fit: BoxFit.contain,
                  ),
                ),

                //?Offer types are displayed here
                FutureBuilder(
                  future: _dbHelper.getOffersList(network: widget.networkId),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      offersList = snapshot.data;
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: offersList.length,
                        itemBuilder: (context, index) {
                          Offers offer = offersList[index];
                          return Card(
                            clipBehavior: Clip.hardEdge,
                            margin: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 3.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            color: widget.backColor,
                            child: ListTile(
                              contentPadding: EdgeInsets.only(left: 5),
                              leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  offerIcon.getIcon(offer.pic),
                                  color: widget.backColor,
                                ),
                              ),
                              title: Text(
                                offer.name,
                                style: kOfferTextStyle,
                              ),
                              onTap: () => Get.to(
                                () => PackageScreen(
                                  title: widget.simTitle + offer.name,
                                  backColor: widget.backColor,
                                  network: widget.networkId,
                                  offerNo: offer.no,
                                  isFavourite: false,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
            SizedBox(
              height: height * 0.08,
            ),
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

//Drawer For Basic Code
  Drawer buildDrawer() {
    return Drawer(
      child: ListView(
        children: [
          //creating drawer header here
          offerDrawer.createHeader(
              backColor: widget.backColor,
              imgAddress: widget.imgAddress,
              simTitle: widget.simTitle),
          FutureBuilder(
            future: _dbHelper.getBasicCodeList(network: widget.networkId),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                basicCodeList = snapshot.data;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: basicCodeList.length,
                  itemBuilder: (context, index) {
                    BasicCode basicCode = basicCodeList[index];
                    // creating drawer items here
                    return offerDrawer.createDrawerItem(
                        index: index,
                        basicCode: basicCodeList[index],
                        onTap: () {
                          Navigator.pop(context);
                          index == 4
                              ? _displayRechargeDialog(
                                  context: context, code: basicCode.code)
                              : index == 6
                                  ? _displayBalanceShareDialog(
                                      context: context, code: basicCode.code)
                                  : _launchURL(basicCode.code);
                        });
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
