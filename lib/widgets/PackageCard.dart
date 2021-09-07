import 'package:auto_size_text/auto_size_text.dart';
import 'package:facebook_audience_network/ad/ad_banner.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simackges/controller/FavColorController.dart';

import 'package:simackges/services/HelperFunction.dart';
import 'package:simackges/services/constants.dart';
import 'package:simackges/models/Packages.dart';
import 'package:simackges/services/packageFomatHelper.dart';
import 'package:simackges/views/DetailsScreen.dart';
import 'package:simackges/widgets/PackageColumn.dart';

class PackageCard extends StatelessWidget {
  const PackageCard({
    Key? key,
    required List<Packages> packagesList,
    required this.height,
    required this.backColor,
    required this.packageItemTstyle,
    required this.title,
  })  : _packagesList = packagesList,
        super(key: key);

  final Color backColor;
  final double height;
  final String title;

  final TextStyle packageItemTstyle;

  final List<Packages> _packagesList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      addAutomaticKeepAlives: true,
      itemCount: _packagesList.length,
      cacheExtent: 10,
      separatorBuilder: (BuildContext context, int index) => index % 3 == 0
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(),
                SizedBox(
                  height: 50,
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 3.5, horizontal: 15),
                    child: FacebookBannerAd(
                      placementId: kDetailBannerFbAdId,
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
                  ),
                ),
                const Divider(),
              ],
            )
          : const Divider(),
      itemBuilder: (context, index) {
        Packages package = _packagesList[index];
        //we reset the package Column counter to 0 ,before making card
        PackageColumn.count = 0;

        return Card(
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 3.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                //? this row is for name ,validity,price and brand logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            package.name,
                            style: kGreenHeadingStyle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            width: 0,
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              package.validity != null
                                  ? AutoSizeText.rich(
                                      TextSpan(
                                          style: kPackageTextStyle,
                                          text: 'Validity: ',
                                          children: [
                                            TextSpan(
                                              text: formatValidity(
                                                  validity: package.validity!),
                                              style: kGreenTextStyle.copyWith(
                                                  color: Colors.red),
                                            )
                                          ]),
                                      maxLines: 2,
                                    )
                                  : Container(
                                      height: 0,
                                      width: 0,
                                    ),
                              package.price != null
                                  ? AutoSizeText.rich(
                                      TextSpan(
                                          style: kPackageTextStyle,
                                          text: 'Rs: ',
                                          children: [
                                            TextSpan(
                                              text: "${package.price}",
                                              style: kGreenTextStyle,
                                            )
                                          ]),
                                      maxLines: 2,
                                    )
                                  : Container(
                                      height: 0,
                                      width: 0,
                                    ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      margin: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: kPtclColor, width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      alignment: Alignment.center,
                      height: height * 0.065,
                      child: Image.asset(
                        HelperFunction.getSimPic(package.pic),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                  width: 5,
                ),
                //? this row is for the package details like mins ,sms , mbs.
                Row(
                  children: [
                    package.onnet != null
                        ? PackageColumn(
                            backColor: backColor,
                            title: package.onnet!,
                            packageItemTstyle: packageItemTstyle,
                            icon: Icons.phone,
                            text: kOnNetText,
                            sizeDecrement: true,
                          )
                        : Container(
                            height: 0,
                            width: 0,
                          ),
                    package.offnet != null
                        ? PackageColumn(
                            backColor: backColor,
                            title: package.offnet!,
                            packageItemTstyle: packageItemTstyle,
                            icon: Icons.phone_forwarded,
                            text: kOffNetText,
                            sizeDecrement: true,
                          )
                        : Container(
                            height: 0,
                            width: 0,
                          ),
                    package.sms != null
                        ? PackageColumn(
                            backColor: backColor,
                            title: package.sms!,
                            packageItemTstyle: packageItemTstyle,
                            icon: Icons.sms,
                            text: kSmsItemText,
                            sizeDecrement: true,
                          )
                        : Container(
                            height: 0,
                            width: 0,
                          ),
                    package.mbs != null
                        ? PackageColumn(
                            backColor: backColor,
                            title: package.mbs!,
                            packageItemTstyle: packageItemTstyle,
                            icon: Icons.import_export,
                            text: kMBsItemText,
                            sizeDecrement: true,
                          )
                        : Container(
                            height: 0,
                            width: 0,
                          ),
                  ],
                ),

                const SizedBox(
                  height: 5,
                  width: 5,
                ),
                //? this row is for the buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //* Subsctribe button here
                    ElevatedButton(
                      onPressed: () => HelperFunction.displayInstructionDialog(
                        context: context,
                        backColor: backColor,
                        rechargeTitle: 'Confirmation',
                        package: package,
                      ),
                      style: TextButton.styleFrom(
                          primary: backColor, backgroundColor: Colors.white),
                      child: Text('Subscribe', style: packageItemTstyle),
                    ),

                    //? View detail button here
                    ElevatedButton(
                      onPressed: () {
                        //? here we are changing the current value of package to see
                        //? if the current package is favourite
                        Get.find<FavColorController>(tag: 'yes').changeValue(
                            name: package.name, network: package.network);

                        //* moving to details screen
                        Get.to(
                          () => DetailScreen(
                              title: title,
                              package: package,
                              backColor: backColor),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: backColor,
                      ),
                      child: Text('View Detail',
                          style:
                              packageItemTstyle.copyWith(color: Colors.white)),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
