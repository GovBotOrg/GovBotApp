import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: const Center(
          child: Icon(
            Icons.arrow_forward,
            color: AppColors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
