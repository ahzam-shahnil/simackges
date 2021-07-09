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
          ListTile(
              leading: Icon(Icons.share_sharp),
              horizontalTitleGap: 8,
              focusColor: Colors.grey,
              title: const Text('Share This App'),
              onTap: () async {
                await Share.share(
                    'Check out the app .\n This app contains all network packages 2021 updated.\n$kAppAddress');
              }),
          ListTile(
            horizontalTitleGap: 8,
            leading: Icon(Icons.star_border_outlined),
            focusColor: Colors.grey,
            title: const Text('Support Us'),
            onTap: () => HelperFunction.launchURl(kAppAddress),
          ),
          ListTile(
            horizontalTitleGap: 8,
            leading: Icon(Icons.policy_outlined),
            focusColor: Colors.grey,
            title: const Text('Privacy Policy'),
            onTap: () => HelperFunction.launchURl(kPrivacyUrl),
          ),
          ListTile(
            leading: Icon(Icons.info_outline_rounded),
            horizontalTitleGap: 8,
            focusColor: Colors.grey,
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
                applicationVersion: '1.0.3',
                applicationLegalese:
                    '©2021 https://sites.google.com/view/simackges/home',
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        kAboutDialogText,
                        maxLines: 20,
                      ))
                ],
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.power_settings_new),
            focusColor: Colors.grey,
            title: const Text('Exit'),
            horizontalTitleGap: 8,
            onTap: () => SystemNavigator.pop(),
          ),
        ],
      ),
    );
  }
}
