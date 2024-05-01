// import 'package:flutter/material.dart';
// import 'package:ollygemini/screens/home/settings.dart';
//
// import '../widgets/custom_card.dart';
// import 'calendar.dart';
// import 'chatbot.dart';
//
// class Dashboard extends StatefulWidget {
//   const Dashboard({Key? key}) : super(key: key);
//
//   @override
//   _DashboardState createState() => _DashboardState();
// }
//
// class _DashboardState extends State<Dashboard> {
//   final String name = "John Doe";
//   int navIndex = 0;
//
//   final List<Widget> _navOptions = [
//     DashboardScreen(),
//     ChatBot(),
//     Calendar(),
//     Settings(),
//   ];
//
//
//
//   void whenItemTapped(int index) {
//     setState(() {
//       navIndex = index;
//     });
//   }
//
//   void navigateToChatBot(BuildContext context, String topic) {
//     // Show dialog to choose conversation type
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         // return AlertDialog(
//         //   title: Text("Choose Conversation Type"),
//         //   content: Text("Do you want a general conversation or an updated one?"),
//         //   actions: [
//         //     TextButton(
//         //       onPressed: () {
//         //         Navigator.of(context).pop();
//         //         // Navigate to ChatBot with general conversation
//         //         Navigator.push(
//         //           context,
//         //           MaterialPageRoute(
//         //             builder: (context) => ChatBot(initialMessage: getInitialMessage(topic)),
//         //           ),
//         //         );
//         //       },
//         //       child: Text("General"),
//         //     ),
//         //     TextButton(
//         //       onPressed: () {
//         //         Navigator.of(context).pop();
//         //         // Navigate to ChatBot with updated conversation
//         //         Navigator.push(
//         //           context,
//         //           MaterialPageRoute(
//         //             builder: (context) => ChatBot(initialMessage: getUpdatedMessage(topic)),
//         //           ),
//         //         );
//         //       },
//         //       child: Text("Updated"),
//         //     ),
//         //   ],
//         // );
//       },
//     );
//   }
//
//   String getInitialMessage(String topic) {
//     // Return the initial message based on the selected topic
//     // You can customize this method to return specific initial messages for different topics
//     switch (topic) {
//       case "Healthcare":
//         return "What is the state of healthcare in Cameroon in 2024?";
//     // Add more cases for other topics if needed
//       default:
//         return "Welcome to the ChatBot!";
//     }
//   }
//
//   String getUpdatedMessage(String topic) {
//     // Return an updated message based on the selected topic
//     // You can customize this method to return specific updated messages for different topics
//     switch (topic) {
//       case "Healthcare":
//         return "What are the latest healthcare initiatives in Cameroon?";
//     // Add more cases for other topics if needed
//       default:
//         return "Welcome to the ChatBot!";
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF6BA8FF),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             CircleAvatar(
//               backgroundImage: AssetImage('assets/images/bigbot.png'),
//             ),
//             Text("Welcome $name"),
//             IconButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Settings()),
//                 );
//               },
//               icon: Icon(Icons.settings),
//             ),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: GridView.count(
//           crossAxisCount: 2,
//           mainAxisSpacing: 16.0,
//           crossAxisSpacing: 16.0,
//           children: [
//             _buildCard(Icons.local_hospital, "Healthcare", context),
//             _buildCard(Icons.school, "Education", context),
//             _buildCard(Icons.gavel, "Government", context),
//             _buildCard(Icons.account_balance, "Politics", context),
//             _buildCard(Icons.account_balance_wallet, "Finance", context),
//             _buildCard(Icons.eco, "Agriculture", context),
//             _buildCard(Icons.add_location, "Religion", context),
//             _buildCard(Icons.sports_soccer, "Sports", context),
//             _buildCard(Icons.computer, "Technology", context),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: navIndex,
//         selectedItemColor: primaryColor,
//         onTap: whenItemTapped,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Dashboard',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.chat),
//             label: 'Chatbot',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.calendar_today),
//             label: 'Calendar',
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCard(IconData icon, String text, BuildContext context) {
//     return GestureDetector(
//       onTap: () => navigateToChatBot(context, text),
//       child: CardWidget(icon: icon, text: text),
//     );
//   }
// }
//
// const Color primaryColor = Color(0xFF3369FF);
//
//
//















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
    DashboardScreen(),
    ChatBot(),
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
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/bigbot.png'),
            ),
            Text("Welcome $name"),
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
            icon: Icon(Icons.home),
            label: 'DashBoardScreen',
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
    );
  }
}

const Color primaryColor = Color(0xFF3369FF);

