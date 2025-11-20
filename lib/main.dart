import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/matches_screen.dart';
import 'screens/teams_screen.dart';
import 'screens/players_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game App',

      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/matches': (context) => const MatchesScreen(),
        '/teams': (context) => const TeamsScreen(),
        '/players': (context) => const PlayersScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
        // onGenerateRoute: (settings) {
        //   Widget page;
        //   switch (settings.name) {
        //     case '/':
        //       page = const HomeScreen();
        //       break;
        //     case '/matches':
        //       page = const MatchesScreen();
        //       break;
        //     case '/teams':
        //       page = const TeamsScreen();
        //       break;
        //     case '/players':
        //       page = const PlayersScreen();
        //       break;
        //     case '/settings':
        //       page = const SettingsScreen();
        //       break;
        //     default:
        //       return null;
        //   }
        //   return PageRouteBuilder(
        //     pageBuilder: (context, animation, secondaryAnimation) => page,
        //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
        //       return FadeTransition(opacity: animation, child: child);
        //     },
        //   );
        // },
      ),
    );
  }
}
