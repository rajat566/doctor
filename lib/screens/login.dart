import 'dart:convert';
import 'dart:ui';
import 'package:doctor/screens/dashboard.dart';
import 'package:doctor/screens/home.dart';
import 'package:doctor/screens/navbar.dart';
import 'package:doctor/screens/signup.dart';
import 'package:doctor/utils/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String? email;
    String? pass;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 245, 245),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/login.jpg'),
              height: 425,
            ),
            SizedBox(
              height: 10,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                      onSaved: (val) {
                        email = val;
                      },
                      controller: mobile,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          MyFlutterApp.mail,
                          color: Color(0xff009899),
                        ),
                        labelText: "Email or Mobile",
                        //  hintText: "johndoe@gmail.com"
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      onSaved: (val) {
                        pass = val;
                      },
                      controller: password,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            MyFlutterApp.lock,
                            color: Color(0xff009899),
                          ),
                          labelText: "Password",
                          hintText: "Enter Password"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 200),
                    child: Text("Forgot password?",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            //  fontSize: 18,
                            color: Color(0xff777A95))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: MaterialButton(
                        minWidth: double.infinity,
                        height: 52,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Color(0xff009899),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            userlogin();
                          }
                          // Navigator.push(context,
                          //  MaterialPageRoute(builder: (context) => Navbar()));
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        Text("Dont have an account ?",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                //  fontSize: 18,
                                color: Color(0xff777A95))),
                        MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                "Create New",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();
  Future<void> userlogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://gravitinfosystems.com/Development/Doctor_App/public/Doctor_API/CustomerLogin'));
    request.fields.addAll({
      'Token': 'AdhgHJHGHhjhhjJl@!98gfcHVH97HGfv#f67Fhg5',
      'Mobile': mobile.text, // '9425307625',
      'Password': password.text
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      await response.stream.bytesToString().then((value) {
        var ReceiveData = json.decode(value);
        print(ReceiveData);
        if (ReceiveData["Status"] == true) {
          var LoginData = ReceiveData["data"][0];

          Map<String, String> data = {
            "userName": LoginData['Name'],
            "userEmail": LoginData['Email'],
            "userMobile": LoginData['Mobile']
          };
          sharedPreferences.setString("userdata", json.encode(data));
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Navbar()));

          print("Login successfully goto Dashboard");
        } else {
          var snackBar =
              SnackBar(content: Text("Enter correct Email & Password"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          print("Login not successfull ");
        }
      });
    }
  }
}
