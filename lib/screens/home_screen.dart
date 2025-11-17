import 'package:flutter/material.dart';
import '../widgets/expansion_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const List<String> liveScoreSubTitles = [
    'Live Scores Match',
    'Schedules',
    'Results',
  ];
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 80, // Reduced height
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 30, 28, 28),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Menu',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ],
              ),
            ),
            ExpansionDrawer(
              title: 'Live Scores',
              subTitles: HomeScreen.liveScoreSubTitles,
            ),
            ExpansionDrawer(title: 'Schedules'),
            // Add more ExpansionDrawers as needed
          ],
        ),
      ),
    );
  }
}
