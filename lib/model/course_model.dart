// To parse this JSON data, do
//
//     final courseModel = courseModelFromJson(jsonString);

import 'dart:convert';

CourseModel courseModelFromJson(String str) =>
    CourseModel.fromJson(json.decode(str));

String courseModelToJson(CourseModel data) => json.encode(data.toJson());

class CourseModel {
  int? status;
  String? message;
  CourseData? data;

  CourseModel({
    this.status,
    this.message,
    this.data,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : CourseData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class CourseData {
  Userdata? userdata;
  List<Story>? stories;
  List<dynamic>? testimonial;
  List<Subject>? subjects;

  CourseData({
    this.userdata,
    this.stories,
    this.testimonial,
    this.subjects,
  });

  factory CourseData.fromJson(Map<String, dynamic> json) => CourseData(
        userdata: json["userdata"] == null
            ? null
            : Userdata.fromJson(json["userdata"]),
        stories: json["stories"] == null
            ? []
            : List<Story>.from(json["stories"]!.map((x) => Story.fromJson(x))),
        testimonial: json["testimonial"] == null
            ? []
            : List<dynamic>.from(json["testimonial"]!.map((x) => x)),
        subjects: json["subjects"] == null
            ? []
            : List<Subject>.from(
                json["subjects"]!.map((x) => Subject.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userdata": userdata?.toJson(),
        "stories": stories == null
            ? []
            : List<dynamic>.from(stories!.map((x) => x.toJson())),
        "testimonial": testimonial == null
            ? []
            : List<dynamic>.from(testimonial!.map((x) => x)),
        "subjects": subjects == null
            ? []
            : List<dynamic>.from(subjects!.map((x) => x.toJson())),
      };
}

class Story {
  String? id;
  String? title;
  DateTime? date;
  String? url;

  Story({
    this.id,
    this.title,
    this.date,
    this.url,
  });

  factory Story.fromJson(Map<String, dynamic> json) => Story(
        id: json["id"],
        title: json["title"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "url": url,
      };
}

class Subject {
  String? id;
  String? title;
  String? courseId;
  String? order;
  String? thumbnail;
  String? background;
  String? icon;
  String? free;
  dynamic instructorId;

  Subject({
    this.id,
    this.title,
    this.courseId,
    this.order,
    this.thumbnail,
    this.background,
    this.icon,
    this.free,
    this.instructorId,
  });

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["id"],
        title: json["title"],
        courseId: json["course_id"],
        order: json["order"],
        thumbnail: json["thumbnail"],
        background: json["background"],
        icon: json["icon"],
        free: json["free"],
        instructorId: json["instructor_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "course_id": courseId,
        "order": order,
        "thumbnail": thumbnail,
        "background": background,
        "icon": icon,
        "free": free,
        "instructor_id": instructorId,
      };
}

class Userdata {
  String? id;
  String? userId;
  String? name;
  String? phone;
  String? deviceId;
  String? deviceIdMessage;
  String? courseId;
  bool? isPurchased;
  String? courseName;
  String? batchName;
  String? batchId;
  String? image;
  String? queryNumber;
  String? instContactPhone;
  String? instContactEmail;
  String? instContactAddress;
  String? privacyPolicy;
  String? dynamicLink;
  String? information;
  String? androidVersion;
  String? iosVersion;
  String? showSwitchCourse;
  int? showAddLiveClass;
  String? showExam;
  String? showPractice;
  String? showMaterial;
  int? showExternalExam;
  String? zoomId;
  String? zoomPassword;
  String? zoomApiKey;
  String? zoomSecretKey;
  String? zoomWebDomain;

  Userdata({
    this.id,
    this.userId,
    this.name,
    this.phone,
    this.deviceId,
    this.deviceIdMessage,
    this.courseId,
    this.isPurchased,
    this.courseName,
    this.batchName,
    this.batchId,
    this.image,
    this.queryNumber,
    this.instContactPhone,
    this.instContactEmail,
    this.instContactAddress,
    this.privacyPolicy,
    this.dynamicLink,
    this.information,
    this.androidVersion,
    this.iosVersion,
    this.showSwitchCourse,
    this.showAddLiveClass,
    this.showExam,
    this.showPractice,
    this.showMaterial,
    this.showExternalExam,
    this.zoomId,
    this.zoomPassword,
    this.zoomApiKey,
    this.zoomSecretKey,
    this.zoomWebDomain,
  });

  factory Userdata.fromJson(Map<String, dynamic> json) => Userdata(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        phone: json["phone"],
        deviceId: json["device_id"],
        deviceIdMessage: json["device_id_message"],
        courseId: json["course_id"],
        isPurchased: json["is_purchased"],
        courseName: json["course_name"],
        batchName: json["batch_name"],
        batchId: json["batch_id"],
        image: json["image"],
        queryNumber: json["query_number"],
        instContactPhone: json["inst_contact_phone"],
        instContactEmail: json["inst_contact_email"],
        instContactAddress: json["inst_contact_address"],
        privacyPolicy: json["privacy_policy"],
        dynamicLink: json["dynamic_link"],
        information: json["information"],
        androidVersion: json["android_version"],
        iosVersion: json["ios_version"],
        showSwitchCourse: json["show_switch_course"],
        showAddLiveClass: json["show_add_live_class"],
        showExam: json["show_exam"],
        showPractice: json["show_practice"],
        showMaterial: json["show_material"],
        showExternalExam: json["show_external_exam"],
        zoomId: json["zoom_id"],
        zoomPassword: json["zoom_password"],
        zoomApiKey: json["zoom_api_key"],
        zoomSecretKey: json["zoom_secret_key"],
        zoomWebDomain: json["zoom_web_domain"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "phone": phone,
        "device_id": deviceId,
        "device_id_message": deviceIdMessage,
        "course_id": courseId,
        "is_purchased": isPurchased,
        "course_name": courseName,
        "batch_name": batchName,
        "batch_id": batchId,
        "image": image,
        "query_number": queryNumber,
        "inst_contact_phone": instContactPhone,
        "inst_contact_email": instContactEmail,
        "inst_contact_address": instContactAddress,
        "privacy_policy": privacyPolicy,
        "dynamic_link": dynamicLink,
        "information": information,
        "android_version": androidVersion,
        "ios_version": iosVersion,
        "show_switch_course": showSwitchCourse,
        "show_add_live_class": showAddLiveClass,
        "show_exam": showExam,
        "show_practice": showPractice,
        "show_material": showMaterial,
        "show_external_exam": showExternalExam,
        "zoom_id": zoomId,
        "zoom_password": zoomPassword,
        "zoom_api_key": zoomApiKey,
        "zoom_secret_key": zoomSecretKey,
        "zoom_web_domain": zoomWebDomain,
      };
}
