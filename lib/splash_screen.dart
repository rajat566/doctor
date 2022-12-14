import 'dart:async';
import 'dart:developer';
import 'package:doctor/onboardingScreen/onboarding_screen.dart';
import 'package:doctor/screens/login.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 4), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image(image: AssetImage('assets/splash.jpg')),
    ));
  }
}
