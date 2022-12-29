// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:superchat/contants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // return ElevatedButton(
    //   onPressed: onPressed,
    //   style: ElevatedButton.styleFrom(
    //     backgroundColor: whiteColor,
    //     minimumSize: const Size(double.infinity, 50),
    //   ),
    // child: Text(
    //   text,
    //   textAlign: TextAlign.center,
    //   style: const TextStyle(
    //       color: backgroundColor,
    //       fontSize: 18,
    //       fontWeight: FontWeight.w700),
    // ),
    // );
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: buttonTextColor,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
