import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatefulWidget {
  final List<String> footerItems;
  final List<IconData> footerIcons;
  const Footer({Key? key, required this.footerItems, required this.footerIcons})
    : super(key: key);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  String selectedRoute = '/';

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '/';
    final routeMap = {
      'Home': '/',
      'Matches': '/matches',
      'Players': '/players',
      'Teams': '/teams',
      'Settings': '/settings',
    };
    return Container(
      decoration: BoxDecoration(color: const Color.fromARGB(255, 30, 28, 28)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...widget.footerItems.map((subtitle) {
            final route = routeMap[subtitle] ?? '/';
            final isSelected = currentRoute == route;
            final selectedColor = Color.fromARGB(255, 246, 130, 6);
            final unselectedColor = Colors.white;
            return Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    selectedRoute = route;
                  });
                  if (currentRoute != route) {
                    Navigator.pushNamed(context, route);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        widget.footerIcons[widget.footerItems.indexOf(
                          subtitle,
                        )],
                        color: isSelected ? selectedColor : unselectedColor,
                      ),
                      SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: isSelected ? selectedColor : unselectedColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
