import 'package:flutter/material.dart';
import 'package:indomie_login/config/const.dart';

class ReusableTextField extends StatelessWidget {
  TextEditingController text;
  String hintText;
  String errorText;
  Widget? icon;
  bool obscure;

  ReusableTextField({
    Key? key,
    required this.text,
    required this.hintText,
    required this.errorText,
    this.icon,
    required this.obscure
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.name,
      controller: text,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: icon,
        hintStyle: const TextStyle(
          color: kDarkBlackColor
        ),
        filled: true,
        fillColor: kWhiteColor,
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(10)
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kLightBlackColor),
            borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}