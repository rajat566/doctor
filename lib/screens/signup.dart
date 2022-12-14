import 'dart:convert';
import 'package:doctor/screens/login.dart';
import 'package:doctor/screens/navbar.dart';
import 'package:doctor/screens/otp.dart';
import 'package:doctor/screens/otp2.dart';
import 'package:doctor/screens/profile.dart';
import 'package:doctor/utils/colors.dart';
import 'package:doctor/utils/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import '../utils/shared_prefrence.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    String _currentAddress;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 245, 245),
      // backgroundColor: AppColors.textColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/signup.jpg'),
              height: 425,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: Icon(MyFlutterApp.mail, color: Color(0xff009899)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Email",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            //  fontSize: 18,
                            color: Color(0xff777A95))),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                        hintText: "Johndoe@gmail.com",
                        hintStyle: TextStyle(fontWeight: FontWeight.w300)),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: Icon(MyFlutterApp.user, color: Color(0xff009899)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Name",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            //  fontSize: 18,
                            color: Color(0xff777A95))),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: name,
                        decoration: InputDecoration(
                            hintText: " Enter your full Name",
                            hintStyle: TextStyle(fontWeight: FontWeight.w300)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: Icon(MyFlutterApp.lock, color: Color(0xff009899)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Password",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            //  fontSize: 18,
                            color: Color(0xff777A95))),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: password,
                        decoration: InputDecoration(
                            hintText: "Enter Password",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                            )),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: Icon(MyFlutterApp.local_phone,
                          color: Color(0xff009899)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Phone Number",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            //  fontSize: 18,
                            color: Color(0xff777A95))),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: IntlPhoneField(
                    controller: mobile,
                    decoration: InputDecoration(
                        labelText: 'Enter your Phone Number',
                        labelStyle: TextStyle(fontWeight: FontWeight.w300)
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
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: MaterialButton(
                      minWidth: double.infinity,
                      height: 52,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Color.fromARGB(255, 56, 131, 116),
                      onPressed: () {
                        userRegister();

                        // Navigator.push(context,
                        //  MaterialPageRoute(builder: (context) => Profile()));
                      },
                      child: Text("Create Account",
                          style: TextStyle(color: Colors.white, fontSize: 20))),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      Text("Alredy have an account?"),
                      MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Text(
                              "Sign In",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();

  Future<void> userRegister() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var headers = {
      'Cookie': 'ci_session=2afa4617b6a7f40e27002bc27036d8c891382581'
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://gravitinfosystems.com/Development/Doctor_App/public/Doctor_API/Registercustomer?email='));
    request.fields.addAll({
      'Email': email.text,
      'Name': name.text,
      'Password': password.text,
      'Token': 'AdhgHJHGHhjhhjJl@!98gfcHVH97HGfv#f67Fhg5',
      'Mobile': mobile.text,
      'FCM': ''
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    print(response.reasonPhrase);

    if (response.statusCode == 200) {
      await response.stream.bytesToString().then((value) async {
        var ReceiveData = json.decode(value);

        print(ReceiveData);

        if (ReceiveData["Status"] == true) {
          var ReceiveData = json.decode(value);

          String Msg = ReceiveData["Msg"];

          print(ReceiveData["Msg"][0]);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => Otp2(
                    quoteText: Msg,
                  )));

          print("Register successfully goto otp");
        } else {
          var snackBar = SnackBar(content: Text("User Alredy Exists"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          print("Register not successfull ");
        }
      });
    }
  }

  TextEditingController FNameController = TextEditingController();
  TextEditingController LNameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController AddressController = TextEditingController();
  TextEditingController MobileNoController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController DOBController = TextEditingController();
}
