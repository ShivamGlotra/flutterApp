import 'package:flutter/material.dart';
import '../widgets/footer.dart';
import 'home_screen.dart';

class TeamsScreen extends StatefulWidget {
  const TeamsScreen({Key? key}) : super(key: key);

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 28, 28),
      appBar: AppBar(
        title: Text('Teams'),
        automaticallyImplyLeading: false,
        titleTextStyle: const TextStyle(
          fontSize: 25,
          color: Color.fromARGB(255, 246, 130, 6),
        ),
        backgroundColor: const Color.fromARGB(255, 30, 28, 28),
      ),
      body: Center(child: Text('Teams Screen Content')),
      bottomNavigationBar: Footer(
        footerItems: HomeScreen.footerItems,
        footerIcons: HomeScreen.footerIcons,
      ),
    );
  }
}
