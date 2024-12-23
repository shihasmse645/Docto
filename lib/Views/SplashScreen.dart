import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ghotest/Views/Home.dart';
import 'package:ghotest/Views/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Set a timer to navigate to HomeScreen
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 22, 101, 165),
      body: Center(
        child: Image.asset(
          'assets/images/logos.png',
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
