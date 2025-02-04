import 'package:flutter/material.dart';
import 'dart:async';

import 'package:myapp/auth/login_or_register.dart'; // For Timer

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // Simulate a delay for app initialization or data loading
    Timer(Duration(seconds: 3), () {
      // Navigate to the next screen (replace HomeScreen with your actual home screen)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginOrRegister()), // Replace with your home screen widget
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9F7EF), // Light green background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo with the "ROOTORIA" text and image
            Image.asset(
              "lib/images/logo/rootoria_logo.png",
              height: 150, // Adjust size as needed
            ),
            SizedBox(height: 20), // Spacing between logo and text
            Text(
              'ROOTORIA',
              style: TextStyle(
                fontSize: 48, // Adjust size as needed
                fontWeight: FontWeight.bold,
                color: Color(0xFF2A6F97), // Dark blue text color
              ),
            ),
            SizedBox(height: 10), // Spacing between title and slogan
            Text(
              'Cultivating connections,\nHarvesting Happiness',
              textAlign: TextAlign.center, // Center the text
              style: TextStyle(
                fontSize: 20, // Adjust size as needed
                fontStyle: FontStyle.italic,
                color: Color(0xFF2A6F97), // Dark blue text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}