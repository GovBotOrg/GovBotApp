import 'package:flutter/material.dart';
import 'package:ollygemini/constants/colors.dart';
import 'package:ollygemini/screens/auth_screens/forgot_password/verify_code.dart';
import 'package:ollygemini/screens/auth_screens/signin.dart';
import 'package:ollygemini/screens/auth_screens/signup.dart';
import 'package:ollygemini/screens/widgets/custom_Button.dart';
import 'package:ollygemini/screens/widgets/custom_textfield.dart';



class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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

                Image.asset("assets/images/reset1.png"),
                const Align(alignment: Alignment.centerLeft, child: Text("Email"),),
                CustomTextField(hintText: "", width: screenWidth, height: screenHeight*0.07, borderColor: AppColors.primaryColor ),


                SizedBox(height: screenHeight*0.06),
                CustomButton(text: 'Send', color: AppColors.primaryColor, width: screenWidth*0.9, onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context)=> OTPVerificationScreen()));

                }, radius: 30, height: 56, textColor: AppColors.white, borderColor: AppColors.primaryColor),
                SizedBox(height: screenHeight*0.15,),
                Container(
                    padding: EdgeInsets.only(left: 60),

                    child: Row(children: [
                      const Text("Already have an account?"),
                      InkWell(child: Text("Sign in"), onTap: (){

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Signin()));



                      },)
                    ],))




                // Row(children: [
                //   Text("Already have an account?"),InkWell(
                //     child: Text("Sign in"),
                //     onTap: () {
                //       Navigator.push(context, MaterialPageRoute(builder: (context) => Signin()));
                //     },
                //   )
                //
                // ],)



















              ],
            ),
          ),),)

    );
  }
}
