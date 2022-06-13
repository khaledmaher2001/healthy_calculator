import 'package:flutter/material.dart';
import 'package:gym/home_page.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SplashScreen(
          title: Text(
            "Healthy",
            style: TextStyle(
              color: Colors.deepOrange,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          useLoader: true,
          image: Image.asset(
            'assets/images/logo.png',
          ),
          photoSize: 100.0,
          navigateAfterSeconds: HomePage(),
          seconds: 3,

        ),
      ),
    );
  }
}
