import 'package:simackges/services/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required TextEditingController textController,
    required this.hintText,
    required this.maxLength,
  })  : _textController = textController,
        super(key: key);

  final TextEditingController _textController;
  final String hintText;
  final int maxLength;
  @override
  Widget build(BuildContext context) {
    return TextField(
        style: kWhiteTextStyle,
        controller: _textController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counterStyle: kWhiteTextStyle,
          hintText: hintText,
          hintStyle: kWhiteTextStyle.copyWith(color: Colors.grey[100]),
        ),
        maxLength: maxLength);
  }
}
