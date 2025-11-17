import 'package:flutter/material.dart';
import '../widgets/expansion_drawer.dart';
import '../widgets/footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const List<String> liveScoreSubTitles = [
    'Live Scores Match',
    'Schedules',
    'Results',
  ];
  static const List<String> footerItems = [
    'Home',
    'Matches',
    'Teams',
    'Players',
    'Settings',
  ];
  static const List<IconData> footerIcons = [
    Icons.home,
    Icons.sports_soccer,
    Icons.group,
    Icons.person,
    Icons.settings,
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
            ExpansionDrawer(
              title: 'Schedules',
              subTitles: HomeScreen.liveScoreSubTitles,
            ),
            // Add more ExpansionDrawers as needed
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 8),
              ],
            ),
            child: Text(
              'Header Container',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Scrollbar(
              thumbVisibility: true,
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 1.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Line of data #${index + 1}',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Footer(
        footerItems: HomeScreen.footerItems,
        footerIcons: HomeScreen.footerIcons,
      ),
    );
  }
}
