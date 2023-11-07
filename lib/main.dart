import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/widgets/SplashScreen.dart';

import 'firebase_options.dart';
import 'package:project/pages/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        } else if (snapshot.hasError) {
          return Directionality(
            child: Text('Error: ${snapshot.error}'),
            textDirection: TextDirection.ltr,
          );
        } else {
          return MaterialApp(
              debugShowMaterialGrid: false,
              debugShowCheckedModeBanner: false,
              title: 'Workout App',
              theme: ThemeData(
                primaryColor: Colors.grey[800],
              ),
              home: MainScreen());
        }
      },
    );
  }
}

