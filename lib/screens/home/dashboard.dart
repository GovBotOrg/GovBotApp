import 'package:flutter/material.dart';
import 'package:ollygemini/screens/home/settings.dart';

import 'calendar.dart';
import 'chatbot.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final String name = "John Doe";
  final int navIndex = 0;

  final List<Widget> _navOptions = [
    Dashboard(),
    ChatBot(),
    Calendar(),
    Settings(),


  ]; //items to navigate to in the navbar

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

class CardWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const CardWidget({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle card tap
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
