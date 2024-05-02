import 'package:flutter/material.dart';
import 'package:ollygemini/screens/splash_screens/splash4.dart';
import '../widgets/custom_next.dart';

class Splash3 extends StatelessWidget {
  const Splash3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/bigbot.png',
                height: screenHeight * 0.4,
                //width: screenWidth,
                fit: BoxFit.fill,
              ),
              SizedBox(height: screenHeight * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 20), // Add some space between the buttons
                  NextButton(
                    onPressed: () {
                      // Perform any action when next button is pressed

                      Navigator.push(context, MaterialPageRoute(builder: (context) => Splash4()));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
