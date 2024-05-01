import 'package:flutter/material.dart';
import 'package:ollygemini/screens/splash_screens/splash2.dart';
import '../../constants/colors.dart';

class Splash1 extends StatefulWidget {
  @override
  _Splash1State createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  @override

  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Splash2()));
  }
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primaryColor, // Background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Asset image
            SizedBox(
              height: screenHeight * 0.25,
            ),
            Container(
              height: screenHeight * 0.32, // 25% of screen height
              child: Image.asset(
                'assets/images/brobot.png',
                height: screenHeight * 0.25,
              ), // Replace 'assets/brobot.png' with your image path
            ),
            SizedBox(height: screenHeight * 0.04),
            const Text(
              "GOVBOT",
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w800,
                color: AppColors.white,
              ),
            ),

            // Circular progress indicator
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
