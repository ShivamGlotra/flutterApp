import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:game_app/widgets/score_cards.dart';
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
  static final List<Map<String, String>> newsItems = [
    {
      'title': 'Flutter 3.0 Released',
      'summary':
          'Flutter 3.0 brings new features and improved performance for cross-platform development.',
    },
    {
      'title': 'Dart 2.18 Announced',
      'summary':
          'Dart 2.18 introduces new language features and better tooling support.',
    },
    {
      'title': 'Community Event: Flutter Engage',
      'summary':
          'Join the global Flutter community for talks, workshops, and networking.',
    },
    {
      'title': 'New Widgets in Flutter',
      'summary': 'Explore the latest widgets added to the Flutter framework.',
    },
    {
      'title': 'Tips for State Management',
      'summary':
          'Learn best practices for managing state in your Flutter apps.',
    },
    {
      'title': 'Performance Optimization',
      'summary':
          'Techniques to improve the performance of your Flutter applications.',
    },
    {
      'title': 'Building Responsive UIs',
      'summary':
          'Create UIs that adapt to different screen sizes and orientations.',
    },
    {
      'title': 'Integrating Firebase',
      'summary':
          'Learn how to integrate Firebase services into your Flutter apps.',
    },
    {
      'title': 'Animations in Flutter',
      'summary':
          'Add engaging animations to enhance user experience in your apps.',
    },
    {
      'title': 'Deploying Flutter Apps',
      'summary':
          'A guide to deploying your Flutter applications to various platforms.',
    },
    {
      'title': 'Accessibility in Flutter',
      'summary':
          'Ensure your apps are accessible to all users with Flutter\'s accessibility features.',
    },
    {
      'title': 'Using Packages Effectively',
      'summary':
          'Discover how to leverage packages from pub.dev to enhance your Flutter projects.',
    },
  ];

  static String _selectedDropdownValue = 'Cricket';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 28, 28),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.sports_cricket, size: 40),
            SizedBox(width: 16),
            DropdownButton<String>(
              value: HomeScreen._selectedDropdownValue,
              alignment: Alignment.center,
              dropdownColor: const Color.fromARGB(255, 30, 28, 28),
              style: TextStyle(
                color: const Color.fromARGB(255, 196, 106, 10),
                fontSize: 25,
              ),
              items:
                  <String>[
                    'Cricket',
                    'Soccer',
                    'Baseball',
                    'Basketball',
                    'Tennis',
                    'Hockey',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  HomeScreen._selectedDropdownValue = newValue!;
                });
              },
              underline: SizedBox(),
            ),
          ],
        ),
        foregroundColor: const Color.fromARGB(255, 196, 106, 10),
        backgroundColor: const Color.fromARGB(255, 30, 28, 28),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 61, // Reduced height
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
            Container(
              color: Colors.grey[350],
              child: Column(
                children: [
                  ExpansionDrawer(
                    title: 'Live Scores',
                    subTitles: HomeScreen.liveScoreSubTitles,
                  ),
                  ExpansionDrawer(
                    title: 'Schedules',
                    subTitles: HomeScreen.liveScoreSubTitles,
                  ),
                ],
              ),
            ),
            // Add more ExpansionDrawers as needed
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScoreCards(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 30.0),
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width, // Set a fixed height
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 36, 34, 34),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              child: Scrollbar(
                thumbVisibility: true,
                thickness: 8,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Add your data widgets here
                      for (var item in HomeScreen.newsItems)
                        ListTile(
                          title: Text(item['title']!),
                          subtitle: Text(item['summary']!),
                          textColor: Colors.white,
                          iconColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 30.0,
                            vertical: 4.0,
                          ),
                        ),
                    ],
                  ),
                ),
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
