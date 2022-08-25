import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  VoidCallback? onPressed;
  String? text;
  Color? color;

  ReusableButton({Key? key,required this.onPressed, required this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width - 40,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text!,
          style: const TextStyle(
              fontSize: 18
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          primary: color,
        ),
      ),
    );
  }
}
