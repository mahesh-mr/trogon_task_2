import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trogon_task_2/config/colors.dart';
import 'package:trogon_task_2/config/fonts.dart';
import 'package:trogon_task_2/controller/controller/home_controller.dart';
import 'package:trogon_task_2/controller/service/home_service/home_service.dart';
import 'package:trogon_task_2/view/home/widget/carocel_widget.dart';
import 'package:trogon_task_2/view/home/widget/home_grid.dart';

import 'widget/bottom_container.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // HomeService.getHomeImpl();
      //     homeController.getHomeScreen();
      //   },
      // ),
      backgroundColor: appBackground,
      appBar: AppBar(
        backgroundColor: appBackground,
        leading: const Icon(
          Icons.menu,
          color: appGrey,
        ),
        actions: [
          const Icon(
            Icons.notifications,
            color: appPrimary,
          ),
          SizedBox(
            width: size.height * 0.02,
          ),
        ],
      ),
      body: Obx(() {
        if (homeController.loding.value) {
          return const Center(
            child: CircularProgressIndicator(
              color: appPrimary,
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child: ListView(
            //  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CarocelSliderWidget(),
              SizedBox(height: size.height * 0.01),
              Text(
                'Our Programmes',
                style: black24W600,
              ),
              SizedBox(height: size.height * 0.01),
              HomeGrid(homeController: homeController, size: size),
              BottomContaner(size: size),
              SizedBox(height: size.height * 0.04),
            ],
          ),
        );
      }),
    );
  }
}
