import 'package:flutter/material.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String dropDownTitle;
  final int number;
  final Function() onTap;
  const MainAppBar({
    Key? key, required this.dropDownTitle, required this.onTap, required this.number,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(45, 46, 49, 1),
        automaticallyImplyLeading: false,
        
        actions: [Container()],
        title: Row(
          children: [
            Text(
              widget.dropDownTitle,
              style:
                  TextStyle(color: Colors.white, fontFamily: 'Halenoir', fontWeight: FontWeight.bold, fontSize: 27),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                widget.number.toString(),
                style: TextStyle(color: Colors.grey.shade400, fontFamily: 'Halenoir', fontWeight: FontWeight.normal, fontSize: 27),
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_drop_down),
              color: Colors.white,
              splashColor:
                  Colors.transparent, // Disable the ink splash animation
              hoverColor: Colors.transparent,
              onPressed: widget.onTap,
            )
          ],
        ));
  }
}
