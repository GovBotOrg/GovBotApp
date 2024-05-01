import 'package:flutter/material.dart';
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
    Dashboard(),
    ChatBot(),
    Calendar(),
    Settings(),


  ];//items to navigate to in the navbar


  void whenItemTapped(index){
    setState(() {

      navIndex = index;

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6BA8FF), // Lighter shade of blue
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/bigbot.png'),
            ),
            Text("Welcome $name"),
            IconButton(
              onPressed: () {
                // Navigate to settings page
              },
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          children: [
            CardWidget(icon: Icons.local_hospital, text: "Healthcare"),
            CardWidget(icon: Icons.school, text: "Education"),
            CardWidget(icon: Icons.gavel, text: "Government"),
            CardWidget(icon: Icons.account_balance, text: "Politics"),
            CardWidget(icon: Icons.account_balance_wallet, text: "Finance"),
            CardWidget(icon: Icons.eco, text: "Agriculture"),
            CardWidget(icon: Icons.add_location, text: "Religion"),
            CardWidget(icon: Icons.sports_soccer, text: "Sports"),
            CardWidget(icon: Icons.computer, text: "Technology"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navIndex,
        onTap: whenItemTapped,
        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chatbot',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
        ],
      ),
    );
  }
}


