import 'dart:convert';

import 'package:doctor/screens/dashboard.dart';
import 'package:doctor/screens/navbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class OTp extends StatefulWidget {
  String quoteText;
  OTp({Key? key, required this.quoteText}) : super(key: key);

  @override
  State<OTp> createState() => _OTpState();
}

class _OTpState extends State<OTp> {
  TextEditingController enterotp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("otp"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            Text("Enter OTP"),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: mobile,
              decoration: InputDecoration(hintText: 'Confirm Mobile Again'),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: code,
                decoration: InputDecoration(hintText: 'Enter OTP'),
              ),
            ),
            SizedBox(
              height: 20,
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
            "userMobile": LoginData['Mobile']
          };
          sharedPreferences.setString("userdata", json.encode(data));
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Navbar()));
          print("Register successfully goto Dashboard");
        } else {
          //  Navigator.of(context).pushReplacement(
          //   MaterialPageRoute(builder: (context) => UserForm()));

          print("otp not correct ");
        }
      });
    }
  }

  // @override
  // void initState() {
  //   loadData();
  //   // TODO: implement initState
  //   super.initState();
  // }

  // Future<void> loadData() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   var mapdata = json.decode(preferences.getString("userdata")!);

  //   setState(() {
  //     //  MobileNo = mapdata['MobileNo'];
  //     msg = mapdata['userName'];

  //     // isDataLoading = true;
  //   });
  // }
}
