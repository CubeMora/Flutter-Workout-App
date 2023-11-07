
import 'package:flutter/material.dart';
import 'package:project/widgets/CustomAppBar.dart';
import 'package:project/widgets/ScaffoldDrawer.dart';


class TestTopDrawer extends StatefulWidget {
  const TestTopDrawer({super.key});

  @override
  _TestTopDrawerState createState() => _TestTopDrawerState();
}

class _TestTopDrawerState extends State<TestTopDrawer> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        title: 'Main Page',
        onTap: () {
          _scaffoldKey.currentState!.openEndDrawer();
        },
      ),
      
      body: Center(
        child: Container(
          color: Colors.amber,
          width: 100.0,
          height: 100.0,
       
        ),
      )
    );
  }
}


