import 'package:doctor/screens/profile.dart';
import 'package:doctor/utils/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Patientdetails extends StatefulWidget {
  const Patientdetails({Key? key}) : super(key: key);

  @override
  State<Patientdetails> createState() => _PatientdetailsState();
}

class _PatientdetailsState extends State<Patientdetails> {
  int _value = 1;

  int get val => 1;

  String? gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Center(
            child: Column(
              children: [
                Text("Patient Details",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                        color: Color(0xff777A95))),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(MyFlutterApp.user_1, color: Color(0xff009899)),
                          SizedBox(
                            width: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Name",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                  color: const Color(0xff777A95)),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 22, right: 18),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Your Full Name",
                          hintStyle: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: const Color(0xff777A95)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // ignore: prefer_const_constructors

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(MyFlutterApp.local_phone,
                              color: Color(0xff009899)),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Phone No",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: const Color(0xff777A95)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 35),
                      child: IntlPhoneField(
                        //   controller: inputcontroller,
                        decoration: InputDecoration(
                          labelText: 'Enter your Phone Number',

                          labelStyle: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: const Color(0xff777A95)),
                          // border: OutlineInputBorder(
                          //   borderSide: BorderSide(),
                          // ),
                        ),
                        initialCountryCode: 'IN',
                        onChanged: (phn) {
                          print(phn.completeNumber);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(MyFlutterApp.user, color: Color(0xff009899)),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Gender",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: const Color(0xff777A95)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        Radio(
                          value: "male",
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          },
                        ),
                        Text(
                          "Male",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: const Color(0xff777A95)),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Radio(
                          value: "Female",
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          },
                        ),
                        Text(
                          "Female",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: const Color(0xff777A95)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(MyFlutterApp.plus, color: Color(0xff009899)),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Please describe your Symtoms",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                  color: const Color(0xff777A95)))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.directions_car_outlined),
                          labelText: "Your Symtoms",
                          labelStyle: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: const Color(0xff777A95)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                        minWidth: 300,
                        height: 52,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Color.fromARGB(255, 56, 131, 116),
                        onPressed: () {},
                        child: Text("Fill Details",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20))),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
