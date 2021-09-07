import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/constants.dart';
import '../widgets/HomeDrawer.dart';
import '../widgets/NetworkCard.dart';
import 'OfferScreen.dart';

class HomeScreen extends StatelessWidget {
  // final NetworkCard customcard = ;

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
              shape: const RoundedRectangleBorder(
                borderRadius: const BorderRadius.only(
                  bottomLeft: const Radius.circular(15),
                  bottomRight: const Radius.circular(15),
                ),
              ),
              expandedHeight: height * 0.26,
              backgroundColor: Colors.blueGrey,
              title: Text(
                kAppTitleText,
                style: const TextStyle(color: Colors.white),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  margin: const EdgeInsets.only(top: 15),
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
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
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
                         NetworkCard(
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
                          NetworkCard(
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
                          NetworkCard(
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
                          NetworkCard(
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
                          NetworkCard(
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
                          NetworkCard(
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
