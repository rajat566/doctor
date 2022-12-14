import 'package:doctor/Models/userlocation.dart';
import 'package:flutter/material.dart';

import '../utils/my_flutter_app_icons.dart';
import '../utils/shared_prefrence.dart';
import 'package:google_fonts/google_fonts.dart';

class Showlocation extends StatefulWidget {
  Showlocation({Key? key}) : super(key: key);

  @override
  State<Showlocation> createState() => _ShowlocationState();
}

class _ShowlocationState extends State<Showlocation> {
  String current = "";
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Datum;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " ${args.cityName} ",
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 20, left: 20),
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    // borderSide: BorderSide(color: Colors.red)
                  ),
                  hintText: "Search doctors, Categories, Dentist",
                  hintStyle: GoogleFonts.raleway(
                      color: Color(0xff777A95), fontWeight: FontWeight.w400),
                  // prefixIcon: Icon(Icons.search),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => Loc()));
                    },
                    child: const Icon(
                      MyFlutterApp.search,
                      size: 25,
                      color: Color(0xff009899),
                    ),
                  ),
                  prefixIconColor: Colors.pink),
            ),
          ),
          Center(child: Text(""))
        ],
      ),
    );
  }

  ProfileState() {
    MySharedPreferences.instance
        .getStringValue("current")
        .then((value) => setState(() {
              current = value;
            }));
  }

  @override
  void initState() {
    ProfileState();
    // TODO: implement initState
    super.initState();
  }
}
