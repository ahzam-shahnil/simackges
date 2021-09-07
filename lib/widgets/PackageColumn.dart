import 'package:simackges/services/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PackageColumn extends StatelessWidget {
  PackageColumn({
    required this.backColor,
    required this.title,
    required this.packageItemTstyle,
    required this.icon,
    required this.text,
    required this.sizeDecrement,
  });

  final Color backColor;
  final String title;
  final IconData icon;
  final String text;
  final bool sizeDecrement;
  final TextStyle packageItemTstyle;
  static int count = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    if (sizeDecrement == true && count < 5) {
      count++;
    }

    return Flexible(
      child: Column(
        children: [
          Icon(
            icon,
            color: backColor,
          ),
          Container(
            width: width / count,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: backColor),
            child: AutoSizeText(
              title,
              textAlign: TextAlign.center,
              style: packageItemTstyle.copyWith(
                color: Colors.white,
                fontSize: title == kUnlimitedText ? 13 : 16.5,
              ),
            ),
          ),
          Text(text, style: packageItemTstyle.copyWith(fontSize: 14)),
        ],
      ),
    );
  }
}
