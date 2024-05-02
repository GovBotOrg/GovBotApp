import 'package:flutter/material.dart';
import 'package:ollygemini/constants/colors.dart';
import 'package:ollygemini/screens/home/dashboard.dart';
import 'package:ollygemini/screens/widgets/custom_Button.dart';
import 'package:ollygemini/screens/widgets/custom_textfield.dart';



class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(automaticallyImplyLeading: true,),

        body: SingleChildScrollView(child: Container(
          padding: EdgeInsets.only(left: screenWidth*0.1, right: screenWidth*0.1),
          child: Center(
            child: Column(
              children: [

              //  Image.asset("assets/images/signup.png"),
                Text("New Password", style: TextStyle(fontSize: 40),),
                SizedBox(height: screenHeight*0.1,),
                const Align(alignment: Alignment.centerLeft, child: Text("Email",textAlign: TextAlign.left,),),
                CustomTextField(hintText: "", width: screenWidth, height: screenHeight*0.07, borderColor: AppColors.primaryColor ),

                SizedBox(height: screenHeight*0.03,),

                Align(alignment: Alignment.centerLeft, child: Text("Confirm Password"),),
                CustomTextField(hintText: "", width: screenWidth, height: screenHeight*0.07, borderColor: AppColors.primaryColor ),
                // SizedBox(height: screenHeight*0.04,),


                SizedBox(height: screenHeight*0.07),
                CustomButton(text: 'Confirm', color: AppColors.primaryColor, width: screenWidth*0.9, onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));

                }, radius: 30, height: 56, textColor: AppColors.white, borderColor: AppColors.primaryColor),
                SizedBox(height: screenHeight*0.03,),

              ],
            ),
          ),),)

    );
  }
}
