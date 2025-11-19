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
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: const Color.fromARGB(255, 30, 28, 28)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...widget.footerItems.map(
            (subtitle) => Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                onPressed: () {
                  // Handle tap
                  switch (subtitle) {
                    case 'Home':
                      if (ModalRoute.of(context)?.settings.name != '/') {
                        Navigator.pushNamed(context, '/');
                      }
                      break;
                    case 'Matches':
                      if (ModalRoute.of(context)?.settings.name != '/matches') {
                        Navigator.pushNamed(context, '/matches');
                      }
                      break;
                    case 'Players':
                      if (ModalRoute.of(context)?.settings.name != '/players') {
                        Navigator.pushNamed(context, '/players');
                      }
                      break;
                    case 'Teams':
                      if (ModalRoute.of(context)?.settings.name != '/teams') {
                        Navigator.pushNamed(context, '/teams');
                      }
                      break;
                    case 'Settings':
                      if (ModalRoute.of(context)?.settings.name !=
                          '/settings') {
                        Navigator.pushNamed(context, '/settings');
                      }
                      break;
                    default:
                      break;
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
                        color: Colors.white,
                      ),
                      SizedBox(height: 4),
                      Text(subtitle, style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
