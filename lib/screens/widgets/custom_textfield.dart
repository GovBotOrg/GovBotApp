import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool centerHintText;
  final Color color;
  final double width;
  final double height;
  final Color borderColor;

  const CustomTextField({
    required this.hintText,
    this.centerHintText = false,
    required this.width,
    this.color = AppColors.white,
    required this.height,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(

            textAlign: centerHintText ? TextAlign.center : TextAlign.start,

            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0), // Adjust padding if needed
            ),
          ),
        ],
      ),
    );
  }
}
