import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ollygemini/constants/colors.dart';
import 'package:ollygemini/screens/home/dashboard.dart';
import 'package:ollygemini/screens/widgets/custom_Button.dart';
import 'package:ollygemini/screens/widgets/custom_textfield.dart';
import 'package:ollygemini/services/firebase_auth_services.dart';



class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {



///creating an instance of firebase services
  final FirebaseAuthService _auth = FirebaseAuthService();


  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }



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
                const Align(alignment: Alignment.centerLeft, child: Text("Name",textAlign: TextAlign.left,),),
                CustomTextField(
                  controller: nameController,



                    hintText: "", width: screenWidth, height: screenHeight*0.07, borderColor: AppColors.primaryColor ),
                SizedBox(height: screenHeight*0.02,),

                const Align(alignment: Alignment.centerLeft, child: Text("Email"),),
                CustomTextField(
                    controller: emailController,
                    hintText: "", width: screenWidth, height: screenHeight*0.07, borderColor: AppColors.primaryColor ),
                SizedBox(height: screenHeight*0.02,),

                Align(alignment: Alignment.centerLeft, child: Text("Password"),),
                CustomTextField(
                    controller: passwordController,
                    hintText: "", width: screenWidth, height: screenHeight*0.07, borderColor: AppColors.primaryColor ),
               // SizedBox(height: screenHeight*0.04,),


                SizedBox(height: screenHeight*0.03),
                CustomButton(text: 'Sign up', color: AppColors.primaryColor, width: screenWidth*0.9, onPressed: _signUp,
                  //   (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
                  // },

                    radius: 30, height: 56, textColor: AppColors.white, borderColor: AppColors.primaryColor),
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

  void _signUp() async{

    String userName = nameController.text;
    String password = passwordController.text;
    String email = emailController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if(user != null){
      print("User successfully created");
      Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));

    }else{
      print("some error happened");
    }

  }




}
