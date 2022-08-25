import 'package:flutter/material.dart';
import 'package:indomie_login/config/const.dart';

class ReusableText extends StatelessWidget {
  final String text;

  const ReusableText({
    Key? key,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        color: kLightBlackColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
