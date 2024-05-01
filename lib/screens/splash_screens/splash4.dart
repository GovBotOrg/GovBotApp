import 'package:flutter/material.dart';
import 'package:ollygemini/constants/colors.dart';
import 'package:ollygemini/screens/widgets/custom_Button.dart';


class Splash4 extends StatefulWidget {
  const Splash4({super.key});

  @override
  State<Splash4> createState() => _Splash4State();
}

class _Splash4State extends State<Splash4> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: screenHeight*0.8,),


              CustomButton(text: 'Get started', color: AppColors.primaryColor, width:298 , onPressed: (){}, radius: 30, height: 56, textColor: AppColors.white, borderColor: AppColors.primaryColor)






            ],
          ),
        ),
      )
    );
  }
}
