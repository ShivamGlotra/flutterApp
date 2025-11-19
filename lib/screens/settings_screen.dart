import 'package:flutter/material.dart';
import '../widgets/footer.dart';
import 'home_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 28, 28),
      appBar: AppBar(
        title: Text('Settings'),
        automaticallyImplyLeading: false,
        foregroundColor: const Color.fromARGB(255, 196, 106, 10),
        backgroundColor: const Color.fromARGB(255, 30, 28, 28),
      ),
      body: Center(child: Text('Settings Screen Content')),
      bottomNavigationBar: Footer(
        footerItems: HomeScreen.footerItems,
        footerIcons: HomeScreen.footerIcons,
      ),
    );
  }
}
