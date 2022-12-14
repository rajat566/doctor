//import 'dart:developer';

import 'dart:convert';
import 'package:doctor/Models/userlocation.dart';
import 'package:doctor/screens/showlocation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/my_flutter_app_icons.dart';
import '../utils/shared_prefrence.dart';

class Loc extends StatefulWidget {
  const Loc({Key? key}) : super(key: key);

  @override
  State<Loc> createState() => _LocState();
}

class _LocState extends State<Loc> {
  //final controller = ScrollController();
  //List<String> items = [];
  // List.generate(15, (index) => 'Item ${index + 1}');
  //int page = 1;
  String name = "";
  @override
  void initState() {
    super.initState();
    _getCurrentPosition();
  }

  String? _currentAddress;
  Position? _currentPosition;
  String current = "";

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);

      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      print(_currentAddress);
      setState(() {
        _currentAddress = '${place.locality},${place.country}';
      });
      MySharedPreferences.instance.setStringValue("current", _currentAddress!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<Userlocation> getdata() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final response = await http.get(Uri.parse(
        'https://gravitinfosystems.com/Development/Doctor_App/public/Doctor_API/Get_Cities?Token=AdhgHJHGHhjhhjJl@!98gfcHVH97HGfv%23f67Fhg5&start=1&limit=5000'));

    var Receivedata = jsonDecode(response.body.toString());
    print(Receivedata);

    if (response.statusCode == 200) {
      // setState(() {
      //   Page++;
      //   items.addAll(Receivedata.map<String>((Item) {
      //     final number = item['id'];
      //     return 'item $number';
      //   }).toList());
      // });

      // if (Receivedata["Status"] == true) {
      //   var LoginData = Receivedata["data"][0];

      //   Map<String, String> data = {
      //     "userName": LoginData['CityName'],
      //     //  "userEmail": LoginData['Email'],
      //     //  "userMobile": LoginData['Mobile']
      //   };
      //   sharedPreferences.setString("current", json.encode(data));
      //   //   Navigator.of(context).pushReplacement(
      //   //  MaterialPageRoute(builder: (context) => Navbar()));
      //   print("Register successfully goto Dashboard");
      // }
      return Userlocation.fromJson(Receivedata);
    }
    //else if ((Receivedata["Status"] == true)) {
    //   return Userlocation.fromJson(Receivedata)
    //    var LoginData = Receivedata["data"][0];

    //    Map<String, String> data = {
    //         "userName": LoginData['Name'],
    //         "userEmail": LoginData['Email'],
    //         "userMobile": LoginData['Mobile']
    //       };
    //          sharedPreferences.setString("userdata", json.encode(data));
    //     //  Navigator.of(context).pushReplacement(
    //        //   MaterialPageRoute(builder: (context) => Navbar()));
    //       print("Register successfully goto Dashboard");
    // }

    else {
      return Userlocation.fromJson(Receivedata);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${_currentAddress ?? ""}')),
      // Text(name)),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                      hintText: "Search location , Categories, Dentist",
                      hintStyle: GoogleFonts.raleway(
                          color: Color(0xff777A95),
                          fontWeight: FontWeight.w400),

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
              SizedBox(
                height: 20,
              ),

              // Text('LAT: ${_currentPosition?.latitude ?? ""}'),
              // Text('LNG: ${_currentPosition?.longitude ?? ""}'),
              // Text(
              //   ' ${_currentAddress ?? ""},',
              //   style:
              //       TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              // ),

              Expanded(
                child: FutureBuilder<Userlocation>(
                    future: getdata(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.data!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Showlocation(),
                                                settings: RouteSettings(
                                                    arguments: snapshot
                                                        .data!.data![index])));
                                      },
                                      child: Card(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "${snapshot.data!.data![index].cityName.toString()}",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      )),
                                    ),
                                  )
                                ],
                              );
                            });
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                    }),
              ),

              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  getdata();
                },
                child: const Text("Get Current Location"),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Future<Userlocation> getdata() async {
  //   final response = await http.get(Uri.parse(
  //       'https://gravitinfosystems.com/Development/Doctor_App/public/Doctor_API/Get_Cities?Token=AdhgHJHGHhjhhjJl@!98gfcHVH97HGfv%23f67Fhg5'));

  //   var data = jsonDecode(response.body.toString());
  //   print(data);

  //   if (response.statusCode == 200) {
  //     return Userlocation.fromJson(data);
  //   } else {
  //     return Userlocation.fromJson(data);
  //   }
  // }

  // Future<void> getdata() async {
  //   var headers = {
  //     'Cookie': 'ci_session=26b79b835fcb3b497bea0e2fb24cbdcfd3faa4dd'
  //   };
  //   var request = http.Request(
  //       'GET',
  //       Uri.parse(
  //           'https://gravitinfosystems.com/Development/Doctor_App/public/Doctor_API/Get_Cities?Token=AdhgHJHGHhjhhjJl@!98gfcHVH97HGfv%23f67Fhg5'));

  //   request.headers.addAll(headers);

  //   http.StreamedResponse response = await request.send();

  //   if (response.statusCode == 200) {
  //     print(await response.stream.bytesToString());

  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }
  ProfileState() {
    MySharedPreferences.instance
        .getStringValue("current")
        .then((value) => setState(() {
              current = value;
            }));
  }

  // @override
  // void initState() {
  //   ProfileState();
  //   // TODO: implement initState
  //   super.initState();
  // }
}
