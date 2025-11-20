import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  DateTime dateTime = DateTime(2025, 11, 20, 21); // Example: Nov 20, 2025, 9 PM

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
            Tab(text: 'LIVE'),
            Tab(text: 'RESULT'),
            Tab(text: 'FIXTURE'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildWidget(
            'LIVE',
            Colors.green,
            '${DateFormat.yMMMd().format(DateTime.now())}, ${DateFormat.jm().format(DateTime.now())}',
          ),
          buildWidget(
            'RESULT',
            Colors.red,
            '${DateFormat.yMMMd().format(DateTime.now())}, ${DateFormat.jm().format(DateTime.now())}',
          ),
          buildWidget(
            'FIXTURE',
            Colors.blue,
            '${DateFormat.yMMMd().format(DateTime.now())}, ${DateFormat.jm().format(DateTime.now())}',
          ),
        ],
      ),
    );
  }

  Widget buildWidget(String text, Color colorPassed, String gameDate) {
    // Example data for demonstration

    final items = List.generate(5, (index) => '$text ');
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey[850],
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    items[index],
                    style: TextStyle(
                      color: colorPassed,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    gameDate,
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  Text(
                    'Game Number 1',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    'Team A vs Team B',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text((() {
                    switch (text) {
                      case 'LIVE':
                        return 'Score: 2 - 1';
                      case 'RESULT':
                        return 'Final Score: 3 - 2';
                      case 'FIXTURE':
                        return 'Scheduled Time: 9:00 PM';
                      default:
                        return '';
                    }
                  }()), style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
