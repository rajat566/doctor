// To parse this JSON data, do
//
//     final userlocation = userlocationFromJson(jsonString);

import 'dart:convert';

Userlocation userlocationFromJson(String str) =>
    Userlocation.fromJson(json.decode(str));

String userlocationToJson(Userlocation data) => json.encode(data.toJson());

class Userlocation {
  Userlocation({
    this.status,
    this.data,
  });

  bool? status;
  List<Datum>? data;

  factory Userlocation.fromJson(Map<String, dynamic> json) => Userlocation(
        status: json["Status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.cityName,
    this.lat,
    this.lng,
  });

  String? id;
  String? cityName;
  String? lat;
  String? lng;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["ID"],
        cityName: json["CityName"],
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CityName": cityName,
        "lat": lat,
        "lng": lng,
      };
}
