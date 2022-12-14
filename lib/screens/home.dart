//import 'dart:developer';

import 'dart:convert';

import 'package:doctor/Models/userlocation.dart';
import 'package:doctor/screens/location.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

import '../utils/my_flutter_app_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  // void initState() {
  //   super.initState();
  //   _getCurrentPosition();
  // }

  String? _currentAddress;
  Position? _currentPosition;

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

  // Future<void> _getCurrentPosition() async {
  //   final hasPermission = await _handleLocationPermission();

  //   if (!hasPermission) return;
  //   await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)

  //       .then((Position position) {
  //     setState(() => _currentPosition = position);
  //     _getAddressFromLatLng(_currentPosition!);
  //   }).catchError((e) {
  //     debugPrint(e);
  //   });
  // }

  // Future<void> _getAddressFromLatLng(Position position) async {
  //   await placemarkFromCoordinates(
  //           _currentPosition!.latitude, _currentPosition!.longitude)
  //       .then((List<Placemark> placemarks) {
  //     Placemark place = placemarks[0];
  //     print(_currentAddress);
  //     setState(() {
  //       _currentAddress = '${place.locality},${place.country}';
  //     });
  //   }).catchError((e) {
  //     debugPrint(e);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('${_currentAddress ?? ""}')),
      body: SafeArea(
        child: Center(
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
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
                                      "joe",
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
                        padding:
                            const EdgeInsets.only(top: 1, right: 20, left: 20),
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
                              prefixIconColor: Colors.pink),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              // Text('LAT: ${_currentPosition?.latitude ?? ""}'),
              // Text('LNG: ${_currentPosition?.longitude ?? ""}'),
              // Text(
              //   ' ${_currentAddress ?? ""},',
              //   style:
              //       TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              // ),

              // Expanded(
              //   child: FutureBuilder<Userlocation>(
              //       future: getdata(),
              //       builder: (context, snapshot) {
              //         if (snapshot.hasData) {
              //           return ListView.builder(
              //               itemCount: snapshot.data!.data!.length,
              //               itemBuilder: (context, index) {
              //                 return Column(
              //                   children: [
              //                     Container(
              //                       height: 50,
              //                       width: MediaQuery.of(context).size.width,
              //                       child: GestureDetector(
              //                         onTap: () {},
              //                         child: Card(
              //                             child: Text(
              //                           "${snapshot.data!.data![index].cityName.toString()}",
              //                         )),
              //                       ),
              //                     )
              //                   ],
              //                 );
              //               });
              //         } else {
              //           return Center(child: CircularProgressIndicator());
              //         }
              //       }),
              // ),

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

  Future<Userlocation> getdata() async {
    final response = await http.get(Uri.parse(
        'https://gravitinfosystems.com/Development/Doctor_App/public/Doctor_API/Get_Cities?Token=AdhgHJHGHhjhhjJl@!98gfcHVH97HGfv%23f67Fhg5'));
    var data = jsonDecode(response.body.toString());
    print(data);
    if (response.statusCode == 200) {
      return Userlocation.fromJson(data);
    } else {
      return Userlocation.fromJson(data);
    }
  }

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
}
