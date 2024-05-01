import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final bool underline;
  final Color borderColor;
  final Color color;
  final Color textColor;
  final double radius;
  final double height;
  final double width;
  final VoidCallback onPressed;

  const CustomButton({
    required this.text,
    this.color = AppColors.primaryColor,
    required this.width,
    required this.onPressed,
    required this.radius, this.height = 65, this.underline = false, required this.textColor, this.borderColor = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: textColor, decoration: underline ? TextDecoration.underline : null),
        ),
      ),
    );
  }
}
