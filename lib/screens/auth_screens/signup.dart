import 'package:flutter/material.dart';
import 'package:ollygemini/constants/colors.dart';
import 'package:ollygemini/screens/home/dashboard.dart';
import 'package:ollygemini/screens/widgets/custom_Button.dart';
import 'package:ollygemini/screens/widgets/custom_textfield.dart';



class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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

                Image.asset("assets/images/signup.png"),
                const Align(alignment: Alignment.centerLeft, child: Text("Email",textAlign: TextAlign.left,),),
                CustomTextField(hintText: "eg John1@gmail.com", width: screenWidth, height: screenHeight*0.07, borderColor: AppColors.primaryColor ),
                SizedBox(height: screenHeight*0.02,),

                const Align(alignment: Alignment.centerLeft, child: Text("Password"),),
                CustomTextField(hintText: "", width: screenWidth, height: screenHeight*0.07, borderColor: AppColors.primaryColor ),
                SizedBox(height: screenHeight*0.02,),

                Align(alignment: Alignment.centerLeft, child: Text("Confirm Password"),),
                CustomTextField(hintText: "", width: screenWidth, height: screenHeight*0.07, borderColor: AppColors.primaryColor ),
               // SizedBox(height: screenHeight*0.04,),


                SizedBox(height: screenHeight*0.03),
                CustomButton(text: 'Sign up', color: AppColors.primaryColor, width: screenWidth*0.9, onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));

                }, radius: 30, height: 56, textColor: AppColors.white, borderColor: AppColors.primaryColor),
                SizedBox(height: screenHeight*0.03,),
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
                      Text("Don't have an account?"),
                      InkWell(child: Text("Sign in"), onTap: (){
                        Navigator.pop(context);



                      },)
                    ],))
              ],
            ),
          ),),)

    );
  }
}
