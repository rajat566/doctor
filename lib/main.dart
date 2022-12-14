import 'package:doctor/screens/home.dart';
import 'package:doctor/screens/login.dart';
import 'package:doctor/screens/navbar.dart';
import 'package:doctor/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(const MyApp());
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('userdata');
  print(token);

  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(MaterialApp(home: token == null ? Splashscreen() : Navbar()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Splashscreen()
    );
  }
}
