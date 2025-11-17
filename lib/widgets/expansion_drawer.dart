import 'package:flutter/material.dart';

class ExpansionDrawer extends StatefulWidget {
  final String title;
  final List<String>? subTitles;
  final String? iconName;

  const ExpansionDrawer({
    Key? key,
    required this.title,
    this.subTitles,
    this.iconName,
  }) : super(key: key);

  @override
  _ExpansionDrawerState createState() => _ExpansionDrawerState();
}

class _ExpansionDrawerState extends State<ExpansionDrawer> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Icon(Icons.calendar_month),
      title: Text(widget.title),
      children: [
        Container(
          decoration: BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                contentPadding: EdgeInsets.only(left: 40.0),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...?widget.subTitles?.map(
                      (subtitle) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: TextButton(
                          onPressed: () {
                            // Handle Live Score Menu tap
                          },
                          child: Text(
                            subtitle,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
