import 'package:flutter/material.dart';
import '../widgets/footer.dart';
import 'home_screen.dart';

class PlayersScreen extends StatefulWidget {
  const PlayersScreen({Key? key}) : super(key: key);

  @override
  State<PlayersScreen> createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 28, 28),
      appBar: AppBar(
        title: Text('Players'),
        automaticallyImplyLeading: false,
        titleTextStyle: const TextStyle(
          fontSize: 25,
          color: Color.fromARGB(255, 246, 130, 6),
        ),
        backgroundColor: const Color.fromARGB(255, 30, 28, 28),
      ),
      body: Center(child: Text('Players Screen Content')),
      bottomNavigationBar: Footer(
        footerItems: HomeScreen.footerItems,
        footerIcons: HomeScreen.footerIcons,
      ),
    );
  }
}
