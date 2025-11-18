import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../widgets/expansion_drawer.dart';
import '../widgets/footer.dart';
import '../widgets/scroll_bar.dart';

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
  ];
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 216, 207, 207),
      appBar: AppBar(
        title: Text('@GETSCORES'),
        backgroundColor: const Color.fromARGB(255, 216, 207, 207),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 62, // Reduced height
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
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.width * 0.35,
              autoPlay: false,
              viewportFraction: 0.7,
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    margin: EdgeInsets.symmetric(
                      horizontal: 5.0,
                      vertical: 5.0,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 36, 34, 34),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: Text('Slide $i', style: TextStyle(fontSize: 16.0)),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 15.0),
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width, // Set a fixed height
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 36, 34, 34),
              ),
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Add your data widgets here
                      for (var item in HomeScreen.newsItems)
                        ListTile(
                          title: Text(item['title']!),
                          subtitle: Text(item['summary']!),
                          textColor: Colors.white,
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
