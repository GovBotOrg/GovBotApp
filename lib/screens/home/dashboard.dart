
import 'package:flutter/material.dart';
import 'package:ollygemini/constants/colors.dart';
import 'package:ollygemini/screens/home/settings.dart';

import '../widgets/custom_card.dart';
import 'calendar.dart';
import 'chatbot.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final String name = "John Doe";
  int navIndex = 0;

  final List<Widget> _navOptions = [
    DashboardScreen(),
    ChatBot(msg: "",),
    Calendar(),
    Settings(),
  ];

  void whenItemTapped(int index) {
    setState(() {
      navIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6BA8FF),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           InkWell(
             onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));},

             child:  CircleAvatar(
             backgroundImage: AssetImage('assets/images/bigbot.png'),
           ),),
            Text("Welcome "),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              },
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
      body: _navOptions[navIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navIndex,
        onTap: whenItemTapped,
        selectedItemColor: primaryColor, // Use primary color for selected item
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: AppColors.primaryColor,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat,  color: AppColors.primaryColor,),
            label: 'Chatbot',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, color: AppColors.primaryColor,),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: AppColors.primaryColor,),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        children: [


          CardWidget(icon: Icons.local_hospital, text: "Healthcare", msg: "What is the state of healthcare in Cameroon"),
          CardWidget(icon: Icons.school, text: "Education", msg: "What is the state of Education in Cameroon"),
          CardWidget(icon: Icons.gavel, text: "Government", msg: "What is the state of Government in Cameroon"),
          CardWidget(icon: Icons.account_balance, text: "Politics", msg: "What is the state of Politics in Cameroon in 2024"),
          CardWidget(icon: Icons.account_balance_wallet, text: "Finance", msg: "What is the econonmic power of Cameroon recently"),
          CardWidget(icon: Icons.eco, text: "Agriculture", msg: "What is the  role of the state in griculture in Cameroon"),
          CardWidget(icon: Icons.add_location, text: "Religion", msg: "What is the state of Religion in Cameroon"),
          CardWidget(icon: Icons.sports_soccer, text: "Sports", msg: "What is the state of Sports in Cameroon"),
          CardWidget(icon: Icons.computer, text: "Technology", msg: "What are the modalities to create a tech startup in Cameroon"),
          CardWidget(icon: Icons.apartment, text: "Infrastructure", msg: "What infrastructure is being built in Cameroon as from 2024"),
          CardWidget(icon: Icons.eco, text: "Environment", msg: "How can I access the ministry of environment with an eco friendly project"),
          CardWidget(icon: Icons.favorite, text: "Social Welfare", msg: "What Social Welfare services are offered in Cameroon"),
          CardWidget(icon: Icons.directions_car, text: "Transportation", msg: "What is the state of Transportation in Cameroon"),
          CardWidget(icon: Icons.language, text: "English to French", msg: "Translate between English and French with ease."),
          CardWidget(icon: Icons.chat, text: "Pidgin Chat", msg: "I want tok with you for Cameroon pidgin. Hafa"),
          CardWidget(icon: Icons.monetization_on, text: "Grants&Funding", msg: "Explore available grants and funding opportunities for various sectors."),


          //   CardWidget(icon: Icons.local_hospital, text: "Healthcare", msg:  "What is the state of healthcare in Cameroon"),
        //   CardWidget(icon: Icons.school, text: "Education", msg:  "What is the state of Education in Cameroon"),
        //   CardWidget(icon: Icons.gavel, text: "Government",  msg:  "What is the state of Education in Cameroon" ),
        //   CardWidget(icon: Icons.account_balance, text: "Politics",  msg:  "What is the state of Education in Cameroon"),
        //   CardWidget(icon: Icons.account_balance_wallet, text: "Finance",  msg:  "What is the state of Education in Cameroon"),
        //   CardWidget(icon: Icons.eco, text: "Agriculture",  msg:  "What is the state of Education in Cameroon"),
        //   CardWidget(icon: Icons.add_location, text: "Religion",  msg:  "What is the state of Education in Cameroon"),
        //   CardWidget(icon: Icons.sports_soccer, text: "Sports",  msg:  "What is the state of Education in Cameroon"),
        //   CardWidget(icon: Icons.computer, text: "Technology",  msg:  "What is the state of Education in Cameroon"),
         ],
      ),
    );
  }
}

const Color primaryColor = Color(0xFF3369FF);




class CardWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final String msg;

  const CardWidget({Key? key, required this.icon, required this.text, required this.msg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatBot(msg: msg,)));
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Color(0xFF3369FF),
            ),
            SizedBox(height: 8),
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}