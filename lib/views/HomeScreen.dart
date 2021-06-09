// ignore: unused_import
import 'package:auto_size_text/auto_size_text.dart';
import 'package:simackges/functions/constants.dart';
import 'package:simackges/views/OfferScreen.dart';
import 'package:simackges/widgets/HomeDrawer.dart';
import 'package:simackges/widgets/NetworkCard.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  final bool _pinned = true;
  final bool _snap = false;
  final bool _floating = false;
  final NetworkCard customcard = NetworkCard();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xfff4f9f9),
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
              expandedHeight: height * 0.249,
              backgroundColor: Color(0xFFf2a154),
              title: Text(
                kAppTitleText,
                style: TextStyle(color: Colors.white),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Card(
                  color: Colors.green[100],
                  margin: EdgeInsets.only(top: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                    child: Image.asset(
                      kDesignImgAddress,
                      fit: BoxFit.contain,
                      alignment: Alignment.bottomCenter,
                    ),
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
                      style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: GridView.count(
                        primary: false,
                        physics: NeverScrollableScrollPhysics(),
                        childAspectRatio: 2 / 1.789,
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: [
                          customcard.getNetworkCard(
                            image: Image.asset(
                              kJazzImgAddress,
                            ),
                            onTap: () => Get.to(
                              OfferScreen(
                                networkId: 1,
                                simTitle: kJazzWaridText,
                                backColor: kJazzColor,
                                imgAddress: kJazzImgAddress,
                              ),
                            )!,
                          ),
                          customcard.getNetworkCard(
                            image: Image.asset(
                              kWaridImgAddress,
                            ),
                            onTap: () => Get.to(
                              OfferScreen(
                                networkId: 1,
                                simTitle: kJazzWaridText,
                                backColor: kJazzColor,
                                imgAddress: kWaridImgAddress,
                              ),
                            )!,
                          ),
                          customcard.getNetworkCard(
                            image: Image.asset(
                              kUfoneImgAddress,
                            ),
                            onTap: () => Get.to(
                              OfferScreen(
                                networkId: 2,
                                simTitle: 'Ufone ',
                                backColor: kUfoneColor,
                                imgAddress: kUfoneImgAddress,
                              ),
                            )!,
                          ),
                          customcard.getNetworkCard(
                            image: Image.asset(
                              kTelenorImgAddress,
                            ),
                            onTap: () => Get.to(
                              OfferScreen(
                                networkId: 3,
                                simTitle: 'Telenor ',
                                backColor: kTelenorColor,
                                imgAddress: kTelenorImgAddress,
                              ),
                            )!,
                          ),
                          customcard.getNetworkCard(
                            image: Image.asset(
                              kZongImgAddress,
                            ),
                            onTap: () => Get.to(
                              OfferScreen(
                                networkId: 4,
                                simTitle: 'Zong ',
                                backColor: kZongColor,
                                imgAddress: kZongImgAddress,
                              ),
                            )!,
                          ),
                          customcard.getNetworkCard(
                            image: Image.asset(
                              kPtclImgAddress,
                            ),
                            onTap: () => Get.to(
                              OfferScreen(
                                networkId: 5,
                                simTitle: 'Ptcl ',
                                backColor: kPtclColor,
                                imgAddress: kPtclImgAddress,
                              ),
                            )!,
                          ),
                        ],
                      ),
                    ),
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
