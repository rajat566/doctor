// To parse this JSON data, do
//
//     final userlist = userlistFromJson(jsonString);

import 'dart:convert';

Userlist userlistFromJson(String str) => Userlist.fromJson(json.decode(str));

String userlistToJson(Userlist data) => json.encode(data.toJson());

class Userlist {
  Userlist({
    this.msg,
    this.status,
    this.astrologers,
    this.category,
    this.selectedCategory,
  });

  String? msg;
  bool? status;
  List<Astrologer>? astrologers;
  List<Category>? category;
  int? selectedCategory;

  factory Userlist.fromJson(Map<String, dynamic> json) => Userlist(
        msg: json["Msg"],
        status: json["Status"],
        astrologers: List<Astrologer>.from(
            json["Astrologers"].map((x) => Astrologer.fromJson(x))),
        category: List<Category>.from(
            json["Category"].map((x) => Category.fromJson(x))),
        selectedCategory: json["SelectedCategory"],
      );

  Map<String, dynamic> toJson() => {
        "Msg": msg,
        "Status": status,
        "Astrologers": List<dynamic>.from(astrologers!.map((x) => x.toJson())),
        "Category": List<dynamic>.from(category!.map((x) => x.toJson())),
        "SelectedCategory": selectedCategory,
      };

  static fromMap(json) {}
}

class Astrologer {
  Astrologer({
    this.astrologerId,
    this.firstName,
    this.lastName,
    this.dob,
    this.astroCat,
    this.gender,
    this.mobile,
    this.email,
    this.address,
    this.state,
    this.pincode,
    this.country,
    this.profilePic,
    this.about,
    this.coreSkills,
    this.language,
    this.expertise,
    this.experience,
    this.chatPrice,
    this.maxChatPrice,
    this.audioCallPrice,
    this.maxAudioCallPrice,
    this.videoCallPrice,
    this.maxVideoCallPrice,
    this.bankName,
    this.bankBranch,
    this.bankAccountNo,
    this.ifscCode,
    this.accountHolderName,
    this.fcmToken,
    this.chatAvailStatus,
    this.callAvailStatus,
    this.videoAvailStatus,
  });

  String? astrologerId;
  String? firstName;
  String? lastName;
  DateTime? dob;
  String? astroCat;
  String? gender;
  String? mobile;
  String? email;
  String? address;
  String? state;
  String? pincode;
  String? country;
  String? profilePic;
  String? about;
  String? coreSkills;
  String? language;
  String? expertise;
  String? experience;
  String? chatPrice;
  String? maxChatPrice;
  String? audioCallPrice;
  String? maxAudioCallPrice;
  String? videoCallPrice;
  String? maxVideoCallPrice;
  String? bankName;
  String? bankBranch;
  String? bankAccountNo;
  String? ifscCode;
  String? accountHolderName;
  String? fcmToken;
  String? chatAvailStatus;
  String? callAvailStatus;
  String? videoAvailStatus;

  factory Astrologer.fromJson(Map<String, dynamic> json) => Astrologer(
        astrologerId: json["Astrologer_id"],
        firstName: json["First_name"],
        lastName: json["Last_name"],
        dob: DateTime.parse(json["Dob"]),
        astroCat: json["AstroCat"],
        gender: json["Gender"],
        mobile: json["Mobile"],
        email: json["Email"],
        address: json["Address"],
        state: json["State"],
        pincode: json["Pincode"],
        country: json["Country"],
        profilePic: json["ProfilePic"],
        about: json["About"],
        coreSkills: json["Core_skills"],
        language: json["Language"],
        expertise: json["Expertise"],
        experience: json["Experience"],
        chatPrice: json["Chat_price"],
        maxChatPrice: json["Max_chat_price"],
        audioCallPrice: json["Audio_call_price"],
        maxAudioCallPrice: json["Max_audio_call_price"],
        videoCallPrice: json["Video_call_price"],
        maxVideoCallPrice: json["Max_video_call_price"],
        bankName: json["Bank_name"],
        bankBranch: json["Bank_branch"],
        bankAccountNo: json["Bank_account_no"],
        ifscCode: json["IFSC_code"],
        accountHolderName: json["Account_holder_name"],
        fcmToken: json["FCM_Token"],
        chatAvailStatus: json["Chat_Avail_status"],
        callAvailStatus: json["Call_Avail_Status"],
        videoAvailStatus: json["Video_Avail_Status"],
      );

  Map<String, dynamic> toJson() => {
        "Astrologer_id": astrologerId,
        "First_name": firstName,
        "Last_name": lastName,
        "Dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "AstroCat": astroCat,
        "Gender": gender,
        "Mobile": mobile,
        "Email": email,
        "Address": address,
        "State": state,
        "Pincode": pincode,
        "Country": country,
        "ProfilePic": profilePic,
        "About": about,
        "Core_skills": coreSkills,
        "Language": language,
        "Expertise": expertise,
        "Experience": experience,
        "Chat_price": chatPrice,
        "Max_chat_price": maxChatPrice,
        "Audio_call_price": audioCallPrice,
        "Max_audio_call_price": maxAudioCallPrice,
        "Video_call_price": videoCallPrice,
        "Max_video_call_price": maxVideoCallPrice,
        "Bank_name": bankName,
        "Bank_branch": bankBranch,
        "Bank_account_no": bankAccountNo,
        "IFSC_code": ifscCode,
        "Account_holder_name": accountHolderName,
        "FCM_Token": fcmToken,
        "Chat_Avail_status": chatAvailStatus,
        "Call_Avail_Status": callAvailStatus,
        "Video_Avail_Status": videoAvailStatus,
      };

  static fromMap(json) {}
}

class Category {
  Category({
    this.astroCat,
    this.catName,
    this.icon,
  });

  String? astroCat;
  String? catName;
  String? icon;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        astroCat: json["Astro_Cat"],
        catName: json["CatName"],
        icon: json["Icon"],
      );

  Map<String, dynamic> toJson() => {
        "Astro_Cat": astroCat,
        "CatName": catName,
        "Icon": icon,
      };
}
