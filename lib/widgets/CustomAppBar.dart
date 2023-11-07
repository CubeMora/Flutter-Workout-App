import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function() onTap;

  CustomAppBar({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          icon: Icon(Icons.arrow_drop_down),
          onPressed: onTap,
        ),
      ],
      
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
