import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trogon_task_2/controller/service/course_service/course_service.dart';
import 'package:trogon_task_2/model/course_model.dart';

class MyCourseController extends GetxController {
  CourseData courseModel = CourseData();
  RxBool loding = true.obs;
  Future<CourseData?> getHomeScreen() async {
    try {
      var homeData = await CourseService.getCourseImpl();
      log('msg name : ${homeData!.userdata!.name}');
      loding.value = false;
      update();
      return homeData;
    } on DioError catch (e) {
    } catch (e) {
      loding.value = false;
    }
    return null;
  }

  @override
  void onInit() {
    getHomeScreen().then((value) => courseModel = value!);
    super.onInit();
  }

  List imageSliders = [
    'assets/cam.png',
    'assets/live.png',
    'assets/exam.png',
  ];

  List strings = [
    'Live Class',
    'Practice',
    'Exame',
  ];
}
