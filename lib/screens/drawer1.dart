//import 'dart:html';

// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:doctor/screens/login.dart';

import 'package:doctor/screens/show_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:doctor/utils/my_flutter_app_icons.dart';

import '../utils/shared_prefrence.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawerr extends StatefulWidget {
  @override
  State<MyDrawerr> createState() => _MyDrawerrState();
}

class _MyDrawerrState extends State<MyDrawerr> {
  String email = "";
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      decoration: const BoxDecoration(
          // image: DecorationImage(
          // image: AssetImage("images/dhoni.jpg"), fit: BoxFit.cover),
          ),
      child: Drawer(
        child: Container(
          // color: Color(0xB316BFC4),
          // color: Color.fromARGB(255, 45, 12, 102),
          color: Color(0xff009899),
          child: ListView(
            children: [
              InkWell(
                splashColor: Colors.blue,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Showdetails()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: Divider.createBorderSide(context,
                          //   color: Color.fromARGB(255, 45, 12, 102),
                          color: Color(0xff009899),
                          //  Color(0xB316BFC4),
                          width: 0.0),
                    ),
                  ),
                  padding: EdgeInsets.zero,
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xff009899),
                      // Color(0xB316BFC4),
                    ),
                    margin: EdgeInsets.zero,
                    accountName: Text(
                      name,
                      style: TextStyle(fontSize: 25, fontFamily: "Ubuntu"),
                    ),
                    accountEmail: Text(
                      email,
                      style: TextStyle(fontFamily: "Ubuntu"),
                    ),
                    currentAccountPicture: CircleAvatar(
                        backgroundImage: AssetImage("assets/dhoni.jpg")
                        //    NetworkImage(
                        // "https: static.wikia.nocookie.net/youtube/images/8/83/Kim_Jong_un_icon.jpg/revision/latest/top-crop/width/360/height/360?cb=20201124202650"
                        //   "https://c.ndtvimg.com/2021-01/itvru3bo_kim-jong-un-letter-650_625x300_01_January_21.jpg"),
                        ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(
                          MyFlutterApp.home,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: (() {
                            print("d");
                            //  Navigator.push(
                            //    context,
                            //  MaterialPageRoute(
                            //    builder: (context) => Show()));
                          }),
                          child: Text(
                            "Home",
                            textScaleFactor: 0.9,
                            style: TextStyle(
                                color: Colors.white, fontFamily: "Ubuntu"),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(
                          MyFlutterApp.call,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Order your Digital Card",
                          textScaleFactor: 0.9,
                          style: TextStyle(
                              color: Colors.white, fontFamily: "Ubuntu"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(
                          MyFlutterApp.person_outline,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Edit Profile",
                          textScaleFactor: 0.9,
                          style: TextStyle(
                              color: Colors.white, fontFamily: "Ubuntu"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(
                          MyFlutterApp.call,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Members Chat",
                          textScaleFactor: 0.9,
                          style: TextStyle(
                              color: Colors.white, fontFamily: "Ubuntu"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(
                          MyFlutterApp.games,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "About",
                          textScaleFactor: 0.9,
                          style: TextStyle(
                              color: Colors.white, fontFamily: "Ubuntu"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(
                          MyFlutterApp.city,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Speak to us",
                          textScaleFactor: 0.9,
                          style: TextStyle(
                              color: Colors.white, fontFamily: "Ubuntu"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(
                          MyFlutterApp.twitter,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          splashColor: Colors.cyanAccent,
                          onTap: () {
                            print("Password");
                          },
                          child: Text(
                            "Change Password",
                            textScaleFactor: 0.9,
                            style: TextStyle(
                                color: Colors.white, fontFamily: "Ubuntu"),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(
                          MyFlutterApp.fast_food,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            signout(context);
                          },
                          child: Text(
                            "Log Out",
                            textScaleFactor: 0.9,
                            style: TextStyle(
                                color: Colors.white, fontFamily: "Ubuntu"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 90,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Follow Us",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: "Ubuntu"),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Material(
                      type: MaterialType.transparency,
                      child: Ink(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            //  color: Colors.greenAccent,
                            borderRadius:
                                BorderRadius.circular(50.0)), //<-- SEE HERE
                        child: InkWell(
                          borderRadius: BorderRadius.circular(100.0),
                          onTap: () {
                            // final url = 'https://instagram.com';
                            // openBrowserURL(url: url, inApp: true);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(MyFlutterApp.instagram,
                                size: 16.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Material(
                      type: MaterialType.transparency,
                      child: Ink(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            // color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(50.0)), //<-- SEE HERE
                        child: InkWell(
                          borderRadius: BorderRadius.circular(100.0),
                          onTap: () async {
                            // final url = 'https://facebook.com';
                            // openBrowserURL(url: url, inApp: true);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              MyFlutterApp.facebook_square,
                              size: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Material(
                      type: MaterialType.transparency,
                      child: Ink(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            // color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(50.0)), //<-- SEE HERE
                        child: InkWell(
                          borderRadius: BorderRadius.circular(100.0),
                          onTap: () async {
                            // final url = 'https://www.youtube.com';
                            // openBrowserURL(url: url, inApp: true);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              MyFlutterApp.youtube,
                              size: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Material(
                      type: MaterialType.transparency,
                      child: Ink(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            // color: Colors.white,
                            borderRadius: BorderRadius.circular(50.0)),
                        //<-- SEE HERE
                        child: InkWell(
                          borderRadius: BorderRadius.circular(100.0),
                          onTap: () async {
                            // final Url = 'https://twitter.com';
                            // if (await canLaunch(Url)) {
                            //   await launch(Url,
                            //       forceSafariVC: true,
                            //       forceWebView: true,
                            //       enableJavaScript: true);
                            // }
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              MyFlutterApp.twitter,
                              size: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                    // IconButton(
                    //   iconSize: 30,
                    //   icon: const Icon(
                    //     MyFlutterApp.youtube,
                    //     color: Colors.deepPurple,
                    //   ),
                    //   // the method which is called
                    //   // when button is pressed
                    //   onPressed: () {
                    //     setState(
                    //       () {},
                    //     );
                    //   },
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "Terms & Condition",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: "Ubuntu"),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text("|",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 8,
                    ),
                    Text("Privacy Policy",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: "Ubuntu"))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future openBrowserURL({
  //   required String url,
  //   bool inApp = true,
  // }) async {
  //   if (await canLaunch(url)) {
  //     await launch(
  //       url,
  //       forceSafariVC: inApp,
  //       forceWebView: inApp,
  //       enableJavaScript: true,
  //     );
  //   }
  // }
  @override
  void initState() {
    loadData();
    // TODO: implement initState
    super.initState();
  }

  Future<void> loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var mapdata = json.decode(preferences.getString("userdata")!);

    setState(() {
      //  MobileNo = mapdata['MobileNo'];
      name = mapdata['userName'];
      email = mapdata['userEmail'];

      // isDataLoading = true;
    });
  }

  Future signout(BuildContext context) async {
    MySharedPreferences.instance.removeAll();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('userdata');
    sharedPreferences.clear();
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
