import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:simackges/services/constants.dart';

class DetailContainer extends StatelessWidget {
  const DetailContainer({
    Key? key,
    required this.width,
    this.value,
    required this.text,
    required this.unit,
    required this.backColor,
  }) : super(key: key);

  final Color backColor;
  final String text;
  final String unit;
  final String? value;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.44,
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: backColor,
              fontFamily: kOpenSansBold,
              fontSize: width * 0.045,
            ),
          ),
          AutoSizeText(
            value != null
                ? text == kPrice
                    ? '$unit ' + value!
                    : value! + ' $unit'
                : '_',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: backColor,
              fontWeight: FontWeight.w500,
              fontSize: width * 0.038,
            ),
          ),
        ],
      ),
    );
  }
}
