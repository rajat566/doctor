import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:doctor/screens/dashboard.dart';
import 'package:doctor/screens/navbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Otp2 extends StatefulWidget {
  String quoteText;
  Otp2({Key? key, required this.quoteText}) : super(key: key);

  @override
  State<Otp2> createState() => _Otp2State();
}

class _Otp2State extends State<Otp2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Otp"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            Text(widget.quoteText),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: IntlPhoneField(
                controller: mobile,
                decoration: InputDecoration(
                    labelText: 'Confirm Mobile Again',
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
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 40),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: code,
                decoration: InputDecoration(hintText: 'Enter OTP'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
                minWidth: double.infinity,
                height: 52,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Color.fromARGB(255, 56, 131, 116),
                onPressed: () {
                  otp();
                  // Navigator.push(context,
                  //  MaterialPageRoute(builder: (context) => Profile()));
                },
                child: Text("Enter Otp",
                    style: TextStyle(color: Colors.white, fontSize: 20))),
          ],
        ),
      ),
    );
  }

  TextEditingController mobile = TextEditingController();

  TextEditingController code = TextEditingController();

  Future<void> otp() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var headers = {
      'Cookie': 'ci_session=ac3e80e9202c6947eb519f0c66b09b591df5c8f6'
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://gravitinfosystems.com/Development/Doctor_App/public/Doctor_API/OTPcustomer'));
    request.fields
        .addAll({'Mobile': mobile.text, 'Verification_code': code.text});

    request.headers.addAll(headers);

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
            "userMobile": LoginData['Mobile'],
          };
          sharedPreferences.setString("userdata", json.encode(data));
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Navbar()));
          print("Register successfully goto Dashboard");
        } else {
          //  Navigator.of(context).pushReplacement(
          //   MaterialPageRoute(builder: (context) => UserForm()));
          var snackBar = SnackBar(content: Text("Wrong Otp"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          print("otp not correct ");
        }
      });
    }
  }
}
