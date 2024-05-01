import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class Splash2 extends StatefulWidget {
  const Splash2({Key? key}) : super(key: key);

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  @override

  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white, // Background color
      body: Container(

        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Asset image



               Image.asset(
                'assets/images/chat1.png', height: screenHeight*0.45,
                width: screenWidth*0.95,
                fit: BoxFit.fill,
              ),

            SizedBox(height: screenHeight*0.05),
            // First Text
            const Text(
              "Your AI Assistant",
              // "Your  government services AI assistant",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: screenHeight*0.05),
            // Second Text
            const Text(
              "Using this software, you can ask your questions and receive articles using artificial intelligence assistant",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),)
    );
  }
}
