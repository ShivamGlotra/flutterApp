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
            SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              height: 50,
              child: SearchBar(
                hintText: 'Search Teams',
                leading: Icon(Icons.search, color: Colors.black),
                onChanged: (value) {
                  // Handle search input
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                itemBuilder: (context, index) {
                  return TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: const Color.fromARGB(
                              255,
                              50,
                              48,
                              48,
                            ),
                            title: Text(
                              'Team ${index + 1} Details Coming Soon',
                              style: TextStyle(color: Colors.white),
                            ),
                            content: Text(
                              'This feature is under development. Stay tuned for updates!',
                              style: TextStyle(color: Colors.white70),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Close',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: ListTile(
                      title: Text(
                        'Team ${index + 1}',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        'Test Ranks : ${index + 1}, ODI Ranks : ${index + 2}, T20 Ranks : ${index + 3}',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
