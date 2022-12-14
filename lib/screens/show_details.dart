import 'dart:convert';

import 'package:doctor/screens/update_prof.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Showdetails extends StatefulWidget {
  Showdetails({Key? key}) : super(key: key);

  @override
  State<Showdetails> createState() => _ShowdetailsState();
}

class _ShowdetailsState extends State<Showdetails> {
  bool status = false;
  String email = "";
  String name = "";
  String mobile = "";

  TextEditingController Mobilecontroller = TextEditingController();
  TextEditingController Namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: ExactAssetImage("assets/prof.jpg"),
                radius: 70,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 263),
              child: Text(
                "Mobile No",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromARGB(255, 222, 215, 215)),
              margin: EdgeInsets.all(6),
              padding: EdgeInsets.only(
                left: 12,
              ),
              child: TextFormField(
                controller: Mobilecontroller..text = '${mobile}',
                decoration: InputDecoration(
                    // focusedBorder: OutlineInputBorder(
                    //     borderSide: BorderSide(
                    //         //  color: Colors.green
                    //         )),
                    hintText: "Mobile No",
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 293),
              child: Text(
                " Name",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromARGB(255, 222, 215, 215)),
              margin: EdgeInsets.all(6),
              padding: EdgeInsets.only(
                left: 12,
              ),
              child: TextFormField(
                controller: Namecontroller..text = '${name}',
                decoration: InputDecoration(
                    // focusedBorder: OutlineInputBorder(
                    //     borderSide: BorderSide(
                    //   color: Colors.green,
                    // )),
                    hintText: " Name",
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 285),
              child: Text(
                "Email",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromARGB(255, 222, 215, 215)),
              margin: EdgeInsets.all(7),
              padding: EdgeInsets.only(left: 10),
              child: TextFormField(
                controller: emailcontroller..text = '${email}',
                decoration: InputDecoration(
                    hintText: "Email", border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 280),
              child: Text(
                "Address",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromARGB(255, 222, 215, 215)),
              margin: EdgeInsets.all(7),
              padding: EdgeInsets.only(left: 10),
              child: TextFormField(
                controller: addresscontroller,
                decoration: InputDecoration(
                    hintText: "Address", border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                  minWidth: double.infinity,
                  height: 52,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Color.fromARGB(255, 56, 131, 116),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Updateprof()));
                  },
                  child: Text("Update Profile",
                      style: TextStyle(color: Colors.white, fontSize: 20))),
            ),
          ],
        ),
      ),
    );
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
      mobile = mapdata['userMobile'];

      //  isDataLoading = true;
    });
  }

  Future<void> Updateprofile() async {
    var headers = {'Cookie': 'ci_session=di1o6r9f272cf66fklgu0iltb13kfoj9'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://gravitinfosystems.com/Development/Doctor_App/public/Doctor_API/UpdateProfile?Token=AdhgHJHGHhjhhjJl@!98gfcHVH97HGfv%23f67Fhg5&Cust_ID=67'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
