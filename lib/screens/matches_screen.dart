import 'package:flutter/material.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 28, 28),
      appBar: AppBar(
        title: Text('Matches'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 25,
          color: Color.fromARGB(255, 246, 130, 6),
        ),
        backgroundColor: const Color.fromARGB(255, 30, 28, 28),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color.fromARGB(255, 246, 130, 6),
          labelColor: const Color.fromARGB(255, 246, 130, 6),
          labelStyle: const TextStyle(fontSize: 16),
          unselectedLabelColor: Colors.white,
          dividerColor: Colors.transparent,
          tabs: [
            Tab(text: 'Live'),
            Tab(text: 'Results'),
            Tab(text: 'Fixtures'),
          ],
        ),
      ),
      body: Center(child: Text('Matches Screen Content')),
    );
  }
}
