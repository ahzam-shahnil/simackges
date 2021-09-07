import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';

import 'package:simackges/services/HelperFunction.dart';
import 'package:simackges/services/constants.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            color: Colors.blueGrey,
            child: DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: Image.asset(
                kDesignImgAddress,
                fit: BoxFit.cover,
              ),
            ),
          ),
          HomeDrawerItem(
            onTap: () async {
              await Share.share(
                  'Check out the app .\n This app contains all network packages 2021 updated.\n$kAppAddress');
            },
            title: const Text('Share This App'),
            leading: const Icon(Icons.share_sharp),
          ),
          HomeDrawerItem(
            leading: const Icon(Icons.star_border_outlined),
            title: const Text('Support Us'),
            onTap: () => HelperFunction.launchURl(kAppAddress),
          ),
          HomeDrawerItem(
            leading: const Icon(Icons.policy_outlined),
            title: const Text('Privacy Policy'),
            onTap: () => HelperFunction.launchURl(kPrivacyUrl),
          ),
          HomeDrawerItem(
            leading: const Icon(Icons.info_outline_rounded),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              showAboutDialog(
                context: context,
                applicationIcon: Image.asset(
                  'assets/images/logo.png',
                  width: Get.size.width * 0.1,
                  height: Get.size.height * 0.1,
                ),
                applicationName: 'Simackges',
                applicationVersion: '1.0.2',
                applicationLegalese:
                    '©2021 https://sites.google.com/view/simackges/home',
                children: <Widget>[
                  const Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: const Text(
                        kAboutDialogText,
                        maxLines: 20,
                      ))
                ],
              );
            },
          ),
          HomeDrawerItem(
            leading: const Icon(Icons.power_settings_new),
            title: const Text('Exit'),
            onTap: () => SystemNavigator.pop(),
          ),
        ],
      ),
    );
  }
}

class HomeDrawerItem extends StatelessWidget {
  const HomeDrawerItem({
    Key? key,
    required this.leading,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final Widget leading;
  final Widget title;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      horizontalTitleGap: 8,
      focusColor: Colors.grey,
      title: title,
      onTap: onTap,
    );
  }
}
