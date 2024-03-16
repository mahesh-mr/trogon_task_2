import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:trogon_task_2/controller/service/course_service/course_json.dart';
import 'package:trogon_task_2/controller/service/home_service/home_json.dart';
import 'package:trogon_task_2/model/home_model.dart';

import '../../../model/course_model.dart';

class CourseService {
  static Future<CourseData?> getCourseImpl() async {
    try {
      CourseModel courseModel = CourseModel.fromJson(courseJson);

      log("msg : $homeJson");
      log('data: ${courseModel.data!.userdata!.name}');
      return courseModel.data!;
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      log("msg : ${e.message}");
      log("msg : ${e.error}");
    } catch (e) {
      log("msg : $e");
    }
    return null;
  }
}
