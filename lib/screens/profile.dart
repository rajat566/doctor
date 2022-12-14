import 'dart:convert';

import 'package:doctor/screens/location.dart';
import 'package:doctor/screens/patient_details.dart';
import 'package:doctor/utils/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String email = "";
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(179, 253, 251, 251),
        body: ListView(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          // color: Color.fromARGB(255, 169, 212, 185),
                          color: Color(0xffDBEFEE),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(24),
                              bottomRight: Radius.circular(24))),
                      // width: double.infinity,
                      //color: Color(0xffDBEFEE),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              height: 50,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  image: const DecorationImage(
                                    // ignore: unnecessary_const
                                    image: const AssetImage(
                                      "assets/dhoni.jpg",
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Container(
                                  child: Padding(
                                      padding: EdgeInsets.only(right: 100),
                                      child:
                                          // style: TextStyle(
                                          //     // color: Colors.amber,
                                          //     color: Color(0xff009899),
                                          //     fontSize: 20,
                                          //     fontWeight: FontWeight.bold,
                                          //     fontFamily: 'Ubanto'),
                                          Text(
                                        name,
                                        style: TextStyle(
                                            // color: Colors.amber,
                                            color: Color(0xff009899),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Ubanto'),
                                      )),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text("Find Your suitable doctor here",
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w400,
                                        //  fontSize: 18,
                                        color: Color(0xff777A95))),
                              ],
                            ),
                            const SizedBox(
                              // width: MediaQuery.of(context).size.width - 130,
                              width: 25,
                            ),
                            Container(
                                alignment: Alignment.topRight,
                                child: const Icon(MyFlutterApp.bell_alt,
                                    size: 30, color: Color(0xff009899)))
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        // Padding(
                        //   padding: EdgeInsets.only(left: 15),
                        //   child: Text("hello"),
                        // ),
                        // SizedBox(
                        //   height: 15,
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.only(left: 15),
                        //   child: Text("what do yo want"),
                        // ),
                        // Container(
                        //   child: Padding(
                        //       padding: const EdgeInsets.only(left: 12, right: 10),
                        //       child: Material(
                        //         elevation: 7,
                        //         borderRadius: BorderRadius.circular(5),
                        //         color: Colors.white,
                        //         child: TextFormField(
                        //           decoration: InputDecoration(
                        //               border: OutlineInputBorder(
                        //                   borderRadius: BorderRadius.circular(5),
                        //                   borderSide: const BorderSide(
                        //                       color: Colors.white10)),
                        //               suffixIcon: const Icon(
                        //                 MyFlutterApp.search,
                        //                 size: 25,
                        //                 color: Color.fromARGB(255, 56, 131, 116),
                        //               ),
                        //               contentPadding:
                        //                   const EdgeInsets.only(left: 10, top: 25),
                        //               hintText: 'search Doctors',
                        //               suffixStyle:
                        //                   const TextStyle(fontFamily: 'ubuntu')),
                        //         ),
                        //       )),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 1, right: 20, left: 20),
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
                                    color: Color(0xff777A95),
                                    fontWeight: FontWeight.w400),
                                // prefixIcon: Icon(Icons.search),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Loc()));
                                  },
                                  child: const Icon(
                                    MyFlutterApp.search,
                                    size: 25,
                                    color: Color(0xff009899),
                                  ),
                                ),
                                prefixIconColor: Colors.pink,
                              

                                ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 230, left: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text('Specialist',
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Color(0xff777A95))
                            // TextStyle(
                            //     fontWeight: FontWeight.w400,
                            //     fontSize: 20,
                            //     fontFamily: 'Raleway'),
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: GestureDetector(
                                  onTap: () {
                                    //  Navigator.push(
                                    //    context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => Signup()));
                                  },
                                  child: Card(
                                    child: Container(
                                      height: 132,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 247, 245, 245),
                                          border: Border.all(
                                            color: Color(0xffA1A2B0),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(children: [
                                          Image.asset(
                                            'assets/head.jpg',
                                            height: 45,
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          const Text(
                                            "Cardio",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Ubanto'),
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          const Text(
                                            "Specialist",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'ubuntu'),
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Text("27 Doctors",
                                              style: GoogleFonts.lato(
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xffA1A2B0),
                                                  fontSize: 11))
                                        ]),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                height: 132,
                                width: 90,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 247, 245, 245),
                                    border: Border.all(
                                      color: Color(0xffA1A2B0),
                                    ),
                                    borderRadius: BorderRadius.circular(7)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(children: [
                                    Image.asset(
                                      'assets/heart.jpg',
                                      height: 45,
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    const Text(
                                      "Heart",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'ubuntu'),
                                    ),
                                    const SizedBox(
                                      height: 1,
                                    ),
                                    const Text(
                                      "Issue",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'ubuntu'),
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Text("27 Doctors",
                                        style: GoogleFonts.lato(
                                          
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xffA1A2B0),
                                            fontSize: 11))
                                  ]),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 132,
                                width: 90,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 247, 245, 245),
                                    border: Border.all(
                                      color: Color(0xffA1A2B0),
                                    ),
                                    borderRadius: BorderRadius.circular(7)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(children: [
                                    Image.asset(
                                      'assets/dentist.jpg',
                                      height: 45,
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    const Text(
                                      "Dental",
                                      // ignore: unnecessary_const
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'ubuntu'),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    const Text(
                                      "Care",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'ubuntu'),
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Text("27 Doctors",
                                        style: GoogleFonts.lato(
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xffA1A2B0),
                                            fontSize: 11))
                                  ]),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 132,
                                width: 90,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        179, 253, 251, 251),
                                    border: Border.all(
                                      color: Color(0xffA1A2B0),
                                    ),
                                    borderRadius: BorderRadius.circular(7)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(children: [
                                    Image.asset(
                                      'assets/head.jpg',
                                      height: 45,
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    const Text(
                                      "Physico",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'ubuntu'),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    const Text(
                                      "Therapy",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'ubuntu'),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text("21 Doctors",
                                        style: GoogleFonts.lato(
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xffA1A2B0),
                                            fontSize: 11))
                                  ]),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text("Get Care",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Color(0xff777A95))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      // minWidth: 20,
                      height: 62,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Color(0xff009899),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Patientdetails()));
                      },
                      child: const Text("Request a Doctor Appointment",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'ubuntu'))),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 125,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 160, top: 10),
                                  child: Text("Cardio Issues?",
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                          color: Color(0xff777A95))),
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                Text(
                                  "For Cardio Patient here can easily",
                                  style: GoogleFonts.lato(
                                      color: Color(0xffA1A2B0),
                                      fontWeight: FontWeight.w400),

                                  // style:
                                  // const TextStyle(
                                  //  // fontWeight: FontWeight.w300,
                                  //   // fontFamily: 'ubuntu'
                                  // ),
                                ),
                                Text(
                                  "contacts with doctors and chat.",
                                  style: GoogleFonts.lato(
                                      color: Color(0xffA1A2B0),
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 125,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(),
                            ),
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 120, top: 10),
                                  child: Text("Dental Treatments?",
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                          color: Color(0xff777A95))),
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                Text(
                                  "For Cardio Patient here can easily",
                                  style: GoogleFonts.lato(
                                      color: Color(0xffA1A2B0),
                                      fontWeight: FontWeight.w400),
                                  // fontFamily: 'ubuntu'
                                ),
                                Text(
                                  "contacts with doctors and chat.",
                                  style: GoogleFonts.lato(
                                      color: Color(0xffA1A2B0),
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text("Top doctors",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Color(0xff777A95))),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          Container(
                            height: 170,
                            width: 125,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 247, 245, 245),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all()),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/doctor1.jpg',
                                      height: 105,
                                    ),
                                  ),
                                ),
                                const Text("Dr. Rajat",
                                    style: TextStyle(fontSize: 15)),
                                Text(
                                  "Heart Surgeon",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff777A95),
                                      fontSize: 12),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 170,
                            width: 125,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 247, 245, 245),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all()),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/doctor2.jpg',
                                      height: 105,
                                    ),
                                  ),
                                ),
                                const Text("Dr. Kalpana",
                                    style: TextStyle(fontSize: 15)),
                                Text(
                                  "cardio Surgeon",
                                  style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff777A95),
                                      fontSize: 12),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 170,
                            width: 125,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 247, 245, 245),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all()),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/doctor1.jpg',
                                      height: 105,
                                    ),
                                  ),
                                ),
                                const Text("Dr. Hasranga",
                                    style: TextStyle(fontSize: 15)),
                                Text("Heart Surgeon",
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff777A95),
                                        fontSize: 12))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }

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
}
