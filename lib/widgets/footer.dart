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
      padding: const EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
      decoration: BoxDecoration(color: const Color.fromARGB(255, 30, 28, 28)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...widget.footerItems.map(
            (subtitle) => Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: TextButton(
                onPressed: () {
                  // Handle tap
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      widget.footerIcons[widget.footerItems.indexOf(subtitle)],
                      color: Colors.white,
                    ),
                    SizedBox(height: 4),
                    Text(subtitle, style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
