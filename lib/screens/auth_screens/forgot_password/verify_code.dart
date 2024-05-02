import 'package:flutter/material.dart';
import 'package:ollygemini/constants/colors.dart';
import 'package:ollygemini/screens/auth_screens/forgot_password/reset_password.dart';
import 'package:ollygemini/screens/widgets/custom_Button.dart';

class OTPVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        //title: Text("Verify Code"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Verify Code", style: TextStyle(fontSize: 36),),


            SizedBox(height: screenWidth*0.25,),
            _buildOTPBoxes(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Resend Code"),
              ],
            ),
            SizedBox(height: screenWidth*0.25),
            CustomButton(text: 'Verify', width: screenWidth*0.7, onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword() ));
            }, radius: 30, textColor: AppColors.white)
          ],
        ),
      ),
    );
  }

  Widget _buildOTPBoxes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildOTPBox(),
        SizedBox(width: 10),
        _buildOTPBox(),
        SizedBox(width: 10),
        _buildOTPBox(),
        SizedBox(width: 10),
        _buildOTPBox(),
      ],
    );
  }

  Widget _buildOTPBox() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: InputDecoration(
          counter: Offstage(),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: OTPVerificationScreen(),
  ));
}
