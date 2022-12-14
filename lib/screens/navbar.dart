import 'package:doctor/screens/dashboard.dart';
import 'package:doctor/screens/drawer1.dart';
import 'package:doctor/screens/home.dart';
import 'package:doctor/screens/login.dart';
import 'package:doctor/screens/profile.dart';
import 'package:doctor/screens/search.dart';
import 'package:doctor/screens/signup.dart';
import 'package:doctor/utils/my_flutter_app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int index = 0;
  final pages = [Profile(), Home(), Search(), Dashboard()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawerr(),
      body: pages[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            // indicatorColor: Color.fromARGB(255, 56, 131, 116),
            labelTextStyle: MaterialStateProperty.all(TextStyle(
          fontSize: 11,
        ))),
        child: NavigationBar(
          backgroundColor: Colors.white,
          //Color.fromARGB(179, 253, 250, 250),
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() {
            this.index = index;
          }),
          destinations: const [
            NavigationDestination(
              icon: Icon(MyFlutterApp.home,
                  size: 35, color: Color.fromRGBO(118, 122, 149, 2)),
              label: "",
            ),
            NavigationDestination(
                icon: Icon(
                  MyFlutterApp.plus,
                  size: 35,
                  color: Color.fromRGBO(118, 122, 149, 10),
                ),
                label: ""),
            NavigationDestination(
                icon: Icon(
                  MyFlutterApp.search,
                  size: 35,
                  color: Color.fromRGBO(118, 122, 149, 10),
                ),
                label: ""),
            NavigationDestination(
                icon: Icon(
                  MyFlutterApp.games,
                  size: 35, //color:Color(0xffDBEFEE),
                  color: Color.fromRGBO(118, 122, 149, 10),
                ),
                label: ""),
          ],
        ),
      ),
    );
  }
}
