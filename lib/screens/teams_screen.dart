import 'package:flutter/material.dart';
import 'home_screen.dart';

class TeamsScreen extends StatefulWidget {
  const TeamsScreen({Key? key}) : super(key: key);
  static final filters = ["International", "IPL", "BBL", "Domestic"];

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 28, 28),
      appBar: AppBar(
        title: Text('Teams'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 25,
          color: Color.fromARGB(255, 246, 130, 6),
        ),
        backgroundColor: const Color.fromARGB(255, 30, 28, 28),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: List.generate(TeamsScreen.filters.length, (index) {
                bool isSelected = selectedIndex == index;
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: index == TeamsScreen.filters.length - 1 ? 0 : 8,
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: isSelected
                            ? Colors.blueGrey
                            : const Color.fromARGB(255, 50, 48, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Text(
                        TeamsScreen.filters[index],
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 30),
            for (int i = 0; i < 10; i++)
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://example.com/team_logo.png',
                  ), // Replace with actual image URL
                ),
                title: Text('Team Name', style: TextStyle(color: Colors.white)),
                subtitle: Text(
                  'Team Details',
                  style: TextStyle(color: Colors.white70),
                ),
                onTap: () {
                  // Handle team selection
                },
              ),
          ],
        ),
      ),
    );
  }
}
