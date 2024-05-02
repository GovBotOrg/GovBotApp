import 'package:flutter/material.dart';
import 'package:ollygemini/constants/colors.dart';
import 'package:ollygemini/screens/auth_screens/forgot_password/forgot_password.dart';
import 'package:ollygemini/screens/auth_screens/signup.dart';
import 'package:ollygemini/screens/home/dashboard.dart';
import 'package:ollygemini/screens/widgets/custom_Button.dart';
import 'package:ollygemini/screens/widgets/custom_textfield.dart';



class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
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

              Image.asset("assets/images/signin.png"),
              const Align(alignment: Alignment.centerLeft, child: Text("Email"),),
              CustomTextField(hintText: "eg John1@gmail.com", width: screenWidth, height: screenHeight*0.07, borderColor: AppColors.primaryColor ),
              SizedBox(height: screenHeight*0.02,),

              const Align(alignment: Alignment.centerLeft, child: Text("Password"),),
              CustomTextField(hintText: "", width: screenWidth, height: screenHeight*0.07, borderColor: AppColors.primaryColor ,),
              Align(alignment: Alignment.centerRight, child: InkWell(
                child: const Text("Forgot password?"),
                onTap: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));

                },

              ),),

              SizedBox(height: screenHeight*0.06),
              CustomButton(text: 'Sign in', color: AppColors.primaryColor, width: screenWidth*0.9, onPressed: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=> const Dashboard()));

              }, radius: 30, height: 56, textColor: AppColors.white, borderColor: AppColors.primaryColor),
              SizedBox(height: screenHeight*0.05,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'OR',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                ],
              ),

              Container(
                padding: EdgeInsets.only(left: 90),
                child: Row(
                children: [
                  Image.asset("assets/images/google.png"), Image.asset("assets/images/facebook.png")
                ],
              ),),
             Container(
                 padding: EdgeInsets.only(left: 60),

                 child: Row(children: [
               const Text("Don't have an account?"),
               InkWell(child: const Text("Signup"), onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));


               },)
             ],))














            ],
          ),
        ),),)

    );
  }
}
