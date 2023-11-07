import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(27, 19, 61, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              duration: const Duration(seconds: 3),
              builder: (context, value, _) =>
                  CircularProgressIndicator(value: value),
            ),
            Image.asset('assets/images/dei.jpg'),
            
          ],
        ),
      ),
    );
  }
}
