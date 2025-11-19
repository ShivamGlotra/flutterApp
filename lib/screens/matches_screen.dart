import 'package:flutter/material.dart';
import '../widgets/footer.dart';
import 'home_screen.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 28, 28),
      appBar: AppBar(
        title: Text('Matches'),
        automaticallyImplyLeading: false,
        foregroundColor: const Color.fromARGB(255, 196, 106, 10),
        backgroundColor: const Color.fromARGB(255, 30, 28, 28),
      ),
      body: Center(child: Text('Matches Screen Content')),
      bottomNavigationBar: Footer(
        footerItems: HomeScreen.footerItems,
        footerIcons: HomeScreen.footerIcons,
      ),
    );
  }
}
