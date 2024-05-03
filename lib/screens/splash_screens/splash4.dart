import 'package:flutter/material.dart';
import 'package:ollygemini/constants/colors.dart';
import 'package:ollygemini/screens/auth_screens/signin.dart';
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 12, right: 12),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: screenHeight*0.2,),

                Image.asset("assets/images/woman2.png", height: screenHeight*0.45,),
                SizedBox(height: screenHeight*0.08,),

                Text("Hello ma kontri pipo dem how for wena!", textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),),
                Text("Accessible AI for All: GovBot - Your Essential Guide to Cameroon's Government Services.",textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),),

                SizedBox(height: screenHeight*0.08,),



                CustomButton(text: 'Get started', color: AppColors.primaryColor, width:298 , onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context) => Signin()));

                }, radius: 30, height: 56, textColor: AppColors.white, borderColor: AppColors.primaryColor),
                SizedBox(height: screenHeight*0.02,),






              ],
            ),
          ),
        )
      )
    );
  }
}
