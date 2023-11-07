import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'package:project/pages/statistics_fragment.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Statistics(), // Aquí se muestra el widget Statistics,
    Text(
      'Likes',
      style: optionStyle,
    ),
    Text(
      'Sa',
      style: optionStyle,
    ),
    Text(
      'Search',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0.0,
        elevation: 0,
        centerTitle: false,
        leadingWidth: 200.0,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //stackUpOptions(),
            FlutterLogo(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text("Dei 4"), FlutterLogo()],
            ),
          ],
        ),
        backgroundColor: Color.fromRGBO(45, 46, 49, 1),
        toolbarHeight: 150.0,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(45, 46, 49, 1),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              // tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.barChartAlt,
                  iconColor: const Color.fromARGB(255, 122, 121, 121),
                  iconSize: 32,
                ),
                GButton(
                  icon: LineIcons.utensils,
                  iconColor: const Color.fromARGB(255, 122, 121, 121),
                  iconSize: 32,
                ),
                GButton(
                  icon: LineIcons.clock,
                  iconColor: const Color.fromARGB(255, 122, 121, 121),
                  iconSize: 32,
                ),
                GButton(
                  icon: LineIcons.rocketChat,
                  iconColor: const Color.fromARGB(255, 122, 121, 121),
                  iconSize: 32,
                ),
                GButton(
                  icon: LineIcons.user,
                  iconColor: const Color.fromARGB(255, 122, 121, 121),
                  iconSize: 32,
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
