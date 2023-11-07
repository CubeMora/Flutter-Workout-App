import 'package:flutter/material.dart';
class TopDrawer extends StatefulWidget {
  @override
  _TopDrawerState createState() => _TopDrawerState();
}

class _TopDrawerState extends State<TopDrawer> {
  bool _canBeDragged = false;
  double _drawerHeight = 100; // Set this to your preferred height

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: _canBeDragged ? (details) => setState(() => _drawerHeight -= details.delta.dy) : null,
      onVerticalDragEnd: (details) => _canBeDragged = false,
      child: Stack(
        children: <Widget>[
          // Your page goes here
          AnimatedPositioned(
            duration: Duration(milliseconds: 1500),
            curve: Curves.easeOut,
            top: _drawerHeight,
            left: 0,
            right: 0,
            child: GestureDetector(
              onVerticalDragStart: (details) => _canBeDragged = true,
              child: Container(
                height: MediaQuery.of(context).size.height - _drawerHeight,
                color: Colors.blue,
                // Your drawer's content goes here
              ),
            ),
          ),
        ],
      ),
    );
  }
}
