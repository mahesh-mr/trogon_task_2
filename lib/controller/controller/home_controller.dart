import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trogon_task_2/controller/service/home_service/home_service.dart';
import 'package:trogon_task_2/model/home_model.dart';

class HomeController extends GetxController {
  RxInt currentCarocelIndex = 0.obs;

  changeCarocelIndex(newIndex) {
    currentCarocelIndex.value = newIndex;
    update();
  }

  Data homeModel = Data();
  RxBool loding = true.obs;
  Future<Data?> getHomeScreen() async {
    try {
      var homeData = await HomeService.getHomeImpl();
      log('msg name : ${homeData!.userdata!.name}');
      loding.value = false;
      update();
      return homeData;
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      log('msg : ${e.message}');
    } catch (e) {
        log('msg : $e');
      loding.value = false;
    }
    return null;
  }

  @override
  void onInit() {
    getHomeScreen().then((value) => homeModel = value!);
    super.onInit();
  }
}
