import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:trogon_task_2/controller/service/home_service/home_json.dart';
import 'package:trogon_task_2/model/home_model.dart';

class HomeService {
  static Future<Data?> getHomeImpl() async {
    try {
      HomeModel homeModel = HomeModel.fromJson(homeJson);

      log("msg : $homeJson");
      log('data: ${homeModel.data!.userdata!.name!}');
      return homeModel.data!;
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
