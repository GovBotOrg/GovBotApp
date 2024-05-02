import 'package:flutter/material.dart';


class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Settings"),
        centerTitle: true,
      ),

      body: Container(
        child: const Column(
          children: [
            
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.shield_moon), ),
              title: Text("Dark Mode"),
              trailing: Icon(Icons.toggle_off_outlined),

              
            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.shield_moon), ),
              title: Text("Dark Mode"),
              trailing: Icon(Icons.toggle_off_outlined),

            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.shield_moon), ),
              title: Text("Language"),
              trailing: Icon(Icons.toggle_off_outlined),

            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.shield_moon), ),
              title: Text("Notificatins"),
              trailing: Icon(Icons.toggle_off_outlined),

            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.shield_moon), ),
              title: Text("FAQs"),
              trailing: Icon(Icons.toggle_off_outlined),

            ),




            ListTile(
              leading: CircleAvatar(child: Icon(Icons.shield_moon), ),
              title: Text("About"),
              trailing: Icon(Icons.toggle_off_outlined),

            ),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.shield_moon), ),
              title: Text("Terms of Services"),
              trailing: Icon(Icons.toggle_off_outlined),

            ),
            ListTile(
              leading: CircleAvatar( child: Icon(Icons.lock), ),
              title: Text("Privacy Policy"),
              trailing: Icon(Icons.toggle_off_outlined),

            ),




          ],
        ),
      ),




    );
  }
}
