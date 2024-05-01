import 'package:flutter/material.dart';



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

      body:   Container(child: Center(
        child: Column(
          children: [

            Image.asset("assets/images/signin.png")








          ],
        ),
      ),),

    );
  }
}
