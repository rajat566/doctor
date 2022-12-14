import 'dart:convert';

import 'package:doctor/screens/login.dart';
import 'package:doctor/screens/show_details.dart';
import 'package:doctor/utils/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/shared_prefrence.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool status = false;
  String email = "";
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 160,
                  width: MediaQuery.of(context).size.width,
                  // ignore: sort_child_properties_last
                  child: const Padding(
                    padding: EdgeInsets.only(left: 120, top: 60),
                    // ignore: unnecessary_const
                    child: const Text(
                      "Settings",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  decoration: const BoxDecoration(
                      // color: Color.fromARGB(255, 169, 212, 185),
                      color: const Color(0xff009899),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(34),
                          bottomRight: const Radius.circular(34))),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          children: [
                            Container(
                              child: const Text(
                                "John Doe ",
                                // ignore: unnecessary_const
                                style: const TextStyle(
                                    // color: Colors.amber,
                                    color: Color(0xff009899),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Ubanto'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Showdetails()));
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 1, right: 20, left: 20),
                        child: Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              color: const Color(0xffDBEFEE),
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: const Radius.circular(20),
                                  bottomRight: const Radius.circular(20),
                                  topLeft: const Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    'assets/dhoni.jpg',
                                    height: 70,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 10),
                                child: Column(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(right: 2),
                                      child: Text(
                                        "Hello!",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      name,
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Color(0xff009899)),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      email,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff009899),
                                      ),
                                    )
                                    // "John Doe",
                                    // style: const TextStyle(
                                    //   fontSize: 25,
                                    //   color: const Color(0xff009899),
                                    // ),
                                    // )
                                  ],
                                ),
                              ),
                              const SizedBox(width: 60),
                              const Icon(
                                MyFlutterApp.bell_alt,
                                color: const Color(0xff009899),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      const Icon(
                        MyFlutterApp.bell_alt,
                        color: const Color(0xff009899),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        width: 20,
                        //    width: MediaQuery.of(context).size.width,
                      ),
                      Text(
                        "Notification",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            color: const Color(0xff777A95)),
                      ),
                      const SizedBox(
                        // width: MediaQuery.of(context).size.width,
                        width: 90,
                      ),
                      FlutterSwitch(
                        activeColor: Colors.blue,
                        toggleColor: Color(0xff009899),
                        width: 90.0,
                        height: 40.0,
                        valueFontSize: 20.0,
                        toggleSize: 25.0,
                        value: status,
                        borderRadius: 30.0,
                        padding: 8.0,
                        showOnOff: true,
                        onToggle: (val) {
                          setState(() {
                            status = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      const Icon(
                        MyFlutterApp.call,
                        color: Color(0xff009899),

                        // color: Colors.white,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Contacts",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            color: const Color(0xff777A95)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      const Icon(
                        MyFlutterApp.user,
                        color: const Color(0xff009899),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Favourite doctors",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            color: const Color(0xff777A95)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      const Icon(
                        MyFlutterApp.games,
                        color: Color(0xff009899),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "FAQs",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            color: const Color(0xff777A95)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      const Icon(
                        MyFlutterApp.person_outline,
                        color: const Color(0xff009899),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Help",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            color: const Color(0xff777A95)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: MaterialButton(
                    minWidth: 300,
                    height: 52,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: const Color(0xff009899),
                    onPressed: () {
                      signout(context);
                      //   Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Navbar()));
                    },
                    child: const Text(
                      "Log Out",
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ProfileState() {
  //   MySharedPreferences.instance
  //       .getStringValue("email")
  //       .then((value) => setState(() {
  //             email = value;
  //           }));
  //   MySharedPreferences.instance
  //       .getStringValue("name")
  //       .then((value) => setState(() {
  //             name = value;
  //           }));
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
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
