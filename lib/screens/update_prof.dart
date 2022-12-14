import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Updateprof extends StatefulWidget {
  Updateprof({Key? key}) : super(key: key);

  @override
  State<Updateprof> createState() => _UpdateprofState();
}

class _UpdateprofState extends State<Updateprof> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Column(
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
              //  controller: Mobilecontroller..text = '${mobile}',
              controller: editedMobile,
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
              //controller: Namecontroller..text = '${name}',
              controller: editedName,
              decoration: InputDecoration(
                  // focusedBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(
                  //   color: Colors.green,
                  // )),
                  hintText: " Name",
                  border: InputBorder.none),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 293),
            child: Text(
              " Email",
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
              //controller: Namecontroller..text = '${name}',
              // controller: editedName,
              decoration: InputDecoration(
                  // focusedBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(
                  //   color: Colors.green,
                  // )),
                  hintText: " Email",
                  border: InputBorder.none),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 293),
            child: Text(
              " Address",
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
              //controller: Namecontroller..text = '${name}',
              //  controller: editedName,
              decoration: InputDecoration(
                  // focusedBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(
                  //   color: Colors.green,
                  // )),
                  hintText: " Address",
                  border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: 20,
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
                  putAccountData();
                  // Navigator.push(context,
                  //  MaterialPageRoute(builder: (context) => Updateprof()));
                },
                child: Text("Edit Profile",
                    style: TextStyle(color: Colors.white, fontSize: 20))),
          ),
        ],
      ),
    );
  }

  Future<void> putAccountData() async {
    var headers = {'Cookie': 'ci_session=j0g9d424iire8chn60iuqbsiv186ni5o'};
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://gravitinfosystems.com/Development/Doctor_App/public/Doctor_API/UpdateProfile'));
    request.fields.addAll({
      'Token': 'AdhgHJHGHhjhhjJl@!98gfcHVH97HGfv#f67Fhg5',
      // 'Cust_ID': '92',
      'Name': editedName.text
      //'mailto': 'email:gauravkhare19@gmail.com',
      // 'DOB': '2022-12-03',
      // 'Gender': 'Male',
      // 'Height': '165',
      // 'Weight': '52',
      // 'Blood': 'B+',
      // 'Address': 'TEST',
      // 'Street': 'TEST',
      // 'City': 'GWALIOR'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  final editedName = TextEditingController();
  final editedMobile = TextEditingController();
}
