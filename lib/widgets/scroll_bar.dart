import 'package:flutter/material.dart';

class ScrollBar extends StatefulWidget {
  final Widget child;
  const ScrollBar({Key? key, required this.child}) : super(key: key);

  @override
  _ScrollBarState createState() => _ScrollBarState();
}

class _ScrollBarState extends State<ScrollBar> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      thickness: 8.0,
      radius: Radius.circular(4.0),
      child: widget.child,
    );
  }
}
