import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:trogon_task_2/view/my_course/my_course.dart';
import 'package:trogon_task_2/view/pages/feed.dart';
import 'package:trogon_task_2/view/pages/notification.dart';

import '../../view/home/home.dart';

class BottomNavigationBarController extends GetxController {
  RxInt currentIndex = 0.obs;

  currentIndexChange(int index) {
    currentIndex.value = index;
  }

  List page = [
    Home(),
    MyCourse(),
    Notificaton(),
    Feed(),
  ];
}
