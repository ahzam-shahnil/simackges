import 'package:get/get.dart';

import 'package:simackges/services/constants.dart';
import 'package:simackges/views/OfferScreen.dart';
import 'package:simackges/widgets/HomeDrawer.dart';
import 'package:simackges/widgets/NetworkCard.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final NetworkCard customcard = NetworkCard();

  final bool _floating = false;
  final bool _pinned = true;
  final bool _snap = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade300,
      drawer: HomeDrawer(),
      body: SafeArea(
        child: CustomScrollView(
          primary: true,
          slivers: [
            SliverAppBar(
              pinned: this._pinned,
              floating: this._floating,
              snap: this._snap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              expandedHeight: height * 0.26,
              backgroundColor: Colors.blueGrey,
              title: Text(
                kAppTitleText,
                style: TextStyle(color: Colors.white),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  margin: EdgeInsets.only(top: 15),
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Image.asset(
                    kDesignImgAddress,
                    fit: BoxFit.fill,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              child: Container(
                padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Column(
                  children: [
                    Text(
                      kPackageText,
                      style: TextStyle(
                          fontSize: height * 0.026,
                          fontFamily: kOpenSans,
                          color: Colors.white),
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(children: [
                          customcard.getNetworkCard(
                            image: Image.asset(
                              kJazzImgAddress,
                              fit: BoxFit.contain,
                            ),
                            onTap: () => Get.to(
                              () => OfferScreen(
                                networkId: 1,
                                simTitle: kJazzWaridText,
                                backColor: kJazzColor,
                                imgAddress: kJazzImgAddress,
                              ),
                            )!,
                          ),
                          customcard.getNetworkCard(
                            image: Image.asset(
                              kUfoneImgAddress,
                            ),
                            onTap: () => Get.to(
                              () => OfferScreen(
                                networkId: 2,
                                simTitle: 'Ufone ',
                                backColor: kUfoneColor,
                                imgAddress: kUfoneImgAddress,
                              ),
                            )!,
                          ),
                          customcard.getNetworkCard(
                            image: Image.asset(
                              kZongImgAddress,
                            ),
                            onTap: () => Get.to(
                              () => OfferScreen(
                                networkId: 4,
                                simTitle: 'Zong ',
                                backColor: kZongColor,
                                imgAddress: kZongImgAddress,
                              ),
                            )!,
                          ),
                        ]),
                        Column(children: [
                          customcard.getNetworkCard(
                            image: Image.asset(
                              kWaridImgAddress,
                            ),
                            onTap: () => Get.to(
                              () => OfferScreen(
                                networkId: 1,
                                simTitle: kJazzWaridText,
                                backColor: kJazzColor,
                                imgAddress: kWaridImgAddress,
                              ),
                            )!,
                          ),
                          customcard.getNetworkCard(
                            image: Image.asset(
                              kTelenorImgAddress,
                            ),
                            onTap: () => Get.to(
                              () => OfferScreen(
                                networkId: 3,
                                simTitle: 'Telenor ',
                                backColor: kTelenorColor,
                                imgAddress: kTelenorImgAddress,
                              ),
                            )!,
                          ),
                          customcard.getNetworkCard(
                            image: Image.asset(
                              kPtclImgAddress,
                            ),
                            onTap: () => Get.to(
                              () => OfferScreen(
                                networkId: 5,
                                simTitle: 'Ptcl ',
                                backColor: kPtclColor,
                                imgAddress: kPtclImgAddress,
                              ),
                            )!,
                          ),
                        ])
                      ],
                    )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
