import 'package:flutter/material.dart';

class PlayersScreen extends StatefulWidget {
  const PlayersScreen({Key? key}) : super(key: key);

  @override
  State<PlayersScreen> createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  // Example teams
  final List<String> teams = [
    "Team A",
    "Team B",
    "Team C",
    "Team D",
    "Team E",
    "Team F",
    "Team G",
    "Team H",
    "Team I",
  ];

  // Track selected team
  int selectedTeamIndex = 0;

  // Example function to generate 10 players for each section
  List<String> getPlayers(String period) {
    return List.generate(10, (index) => "$period Player ${index + 1}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 28, 28),
      appBar: AppBar(
        title: const Text('Players'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 25,
          color: Color.fromARGB(255, 246, 130, 6),
        ),
        backgroundColor: const Color.fromARGB(255, 30, 28, 28),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Scrollable team filters at the top
          SizedBox(
            height: 45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              itemCount: teams.length,
              itemBuilder: (context, index) {
                bool isSelected = selectedTeamIndex == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        selectedTeamIndex = index;
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: isSelected
                          ? Colors.blueGrey
                          : const Color.fromARGB(255, 50, 48, 48),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      teams[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              height: 50,
              child: SearchBar(
                hintText: 'Search Teams',
                leading: Icon(Icons.search, color: Colors.black),
                onChanged: (value) {
                  // Handle search input
                },
              ),
            ),
          ),
          // Expanded scrollable player list
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildPlayerSection("Top Players Today"),
                    buildPlayerSection("Top Players This Week"),
                    buildPlayerSection("Top Players This Month"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for each player section
  Widget buildPlayerSection(String title) {
    List<String> players = getPlayers(title);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(
          title,
          style: const TextStyle(
            color: Colors.orange,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Column(
          children: players.map((player) {
            return TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: const Color.fromARGB(255, 50, 48, 48),
                      title: Text(
                        "Player Name",
                        style: const TextStyle(color: Colors.white),
                      ),
                      content: const Text(
                        'Detailed information coming soon...',
                        style: TextStyle(color: Colors.white70),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text(
                            'Close',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                alignment: Alignment.centerLeft,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://via.placeholder.com/50', // Replace with actual player image
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        player,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'Team: India',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const Text(
                        'Test Ranks: 1, ODI Ranks: 2, T20 Ranks: 3',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
