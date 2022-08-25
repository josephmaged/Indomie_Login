import 'package:flutter/material.dart';
import 'package:indomie_login/config/const.dart';
import 'package:indomie_login/core/model/Employee.dart';

class ReusableTile extends StatelessWidget {
  final String? string;
  const ReusableTile({
    Key? key,
    required this.string
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kWhiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          string!,
          style: const TextStyle(
            fontSize: 14,
            color: kDarkBlackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}