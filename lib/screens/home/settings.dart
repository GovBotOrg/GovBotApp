import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../widgets/build_settings_tile.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.05),
              CircleAvatar(
                radius: 45,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person),
              ),
           //   SizedBox(height: 16.0),
              Text(
                "Bere",
                style: TextStyle(
               //   color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
             // SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Edit",
                  style: TextStyle(color: AppColors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: screenHeight * 0.035),
              buildSettingsTile(
                leading: Image.asset("assets/images/moon.png"),
                title: "Dark Mode",
                trailing: Icon(Icons.toggle_off_outlined),
              ),
              buildSettingsTile(
                leading: Icon(Icons.language),
                title: "Language",
                trailing: Icon(Icons.arrow_forward),
              ),
              buildSettingsTile(
                leading: Icon(Icons.lock),
                title: "Privacy Policy",
                trailing: Icon(Icons.arrow_forward),
              ),
              buildSettingsTile(
                leading: Icon(Icons.shield_moon),
                title: "Notifications",
                trailing: Icon(Icons.arrow_forward),
              ),
              buildSettingsTile(
                leading: Icon(Icons.request_page),
                title: "Terms of Service",
                trailing: Icon(Icons.arrow_forward),
              ),
              buildSettingsTile(
                leading: Icon(Icons.question_mark_outlined),
                title: "FAQs",
                trailing: Icon(Icons.arrow_forward),
              ),
              buildSettingsTile(
                leading: Icon(Icons.shield_moon),
                title: "About",
                trailing: Icon(Icons.toggle_off_outlined),
              ),
              buildSettingsTile(
                leading: Icon(Icons.shield_moon),
                title: "Terms of Services",
                trailing: Icon(Icons.toggle_off_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
