import 'package:simackges/services/constants.dart';
import 'package:flutter/cupertino.dart';

class OfferIcon {
  IconData getIcon(String pic) {
    IconData icon;
    switch (pic) {
      case 'call':
        icon = kCallIcon;
        break;
      case 'sms':
        icon = kMsgIcon;
        break;
      case 'net':
        icon = kWifiicon;
        break;
      case 'other':
        icon = kOtherIcon;
        break;

      default:
        icon = kLocationIcon;
    }
    return icon;
  }
}
