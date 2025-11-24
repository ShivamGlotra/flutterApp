import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:game_app/widgets/score_cards.dart';
import '../widgets/expansion_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const List<String> liveScoreSubTitles = [
    'Live Scores Match',
    'Schedules',
    'Results',
  ];
  static const List<String> teamSubtitles = [
    'International Teams',
    'Domestic Teams',
    'Franchise Teams',
  ];
  static const List<String> rankingSubtitles = ['Top Teams', 'Top Players'];
  static const List<String> playerSubtitles = [
    'Top Batsmen',
    'Top Bowlers',
    'All-Rounders',
  ];
  static const List<String> moreSubTitles = [
    'News',
    'Statistics',
    'Settings',
    'Help & Support',
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

  static const List<IconData> dropdownIcons = [
    Icons.sports_cricket,
    Icons.sports_soccer,
    Icons.sports_baseball,
    Icons.sports_basketball,
    Icons.sports_tennis,
    Icons.sports_hockey,
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
            Icon(
              HomeScreen.dropdownIcons[<String>[
                'Cricket',
                'Soccer',
                'Baseball',
                'Basketball',
                'Tennis',
                'Hockey',
              ].indexOf(HomeScreen._selectedDropdownValue)],
              size: 30,
            ),
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
                // showDialog(
                //   context: context,
                //   builder: (context) {
                //     return AlertDialog(
                //       backgroundColor: const Color.fromARGB(255, 50, 48, 48),
                //       title: Text(
                //         'Sorry, $newValue data is not available yet.',
                //         textAlign: TextAlign.center,
                //         style: const TextStyle(
                //           color: Colors.white,
                //           fontSize: 18,
                //         ),
                //       ),

                //       actions: [
                //         TextButton(
                //           onPressed: () => Navigator.of(context).pop(),
                //           child: const Text(
                //             'Close',
                //             style: TextStyle(color: Colors.blue),
                //           ),
                //         ),
                //       ],
                //     );
                //   },
                // );
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
        backgroundColor: Colors.grey[350],
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
            Column(
              children: [
                ExpansionDrawer(
                  title: 'Live Scores',
                  subTitles: HomeScreen.liveScoreSubTitles,
                ),
                ExpansionDrawer(
                  title: 'Teams',
                  subTitles: HomeScreen.teamSubtitles,
                ),
                ExpansionDrawer(
                  title: "Rankings",
                  subTitles: HomeScreen.rankingSubtitles,
                ),
                ExpansionDrawer(
                  title: 'Players',
                  subTitles: HomeScreen.playerSubtitles,
                ),
                ExpansionDrawer(
                  title: 'More',
                  subTitles: HomeScreen.moreSubTitles,
                ),
                SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.right,
                  'Version 0.0.1',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                Text(
                  textAlign: TextAlign.right,
                  '@GetScores 2025',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
              ],
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
    );
  }
}
