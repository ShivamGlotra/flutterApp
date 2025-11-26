import 'package:flutter/material.dart';
import 'home_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final List<String> items = [
    'My Profile',
    'Notifications',
    'Privacy',
    'Language',
    'Help & Support',
    'About',
    'Terms of Service',
    'Logout',
  ];
  final List<IconData> icons = [
    Icons.person,
    Icons.notifications,
    Icons.lock,
    Icons.language,
    Icons.help,
    Icons.info,
    Icons.description,
    Icons.logout,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 28, 28),
      appBar: AppBar(
        title: Text('More'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 25,
          color: Color.fromARGB(255, 246, 130, 6),
        ),
        backgroundColor: const Color.fromARGB(255, 30, 28, 28),
      ),
      body: Center(
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 10.0),
          itemCount: items.length, // number of players/teams
          itemBuilder: (context, index) {
            return Container(
              // spacing between tiles
              decoration: BoxDecoration(
                color: Colors.grey[800], // background color
                border: Border.all(
                  color: Colors.black, // border color
                  width: 0.2, // border width
                ),
                // rounded corners
              ),
              child: ListTile(
                leading: Icon(icons[index], color: Colors.white),
                title: Text(
                  items[index],
                  style: TextStyle(color: Colors.white),
                ),

                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: const Color.fromARGB(255, 50, 48, 48),
                      title: Text(
                        items[index],
                        style: const TextStyle(color: Colors.white),
                      ),
                      content: Text(
                        'You tapped on ${items[index]}',
                        style: const TextStyle(color: Colors.white70),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            'OK',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
