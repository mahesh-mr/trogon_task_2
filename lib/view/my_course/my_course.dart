import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trogon_task_2/controller/controller/my_course_controller.dart';
import 'package:trogon_task_2/view/my_course/widget/cource_welcom_container.dart';
import 'package:trogon_task_2/view/my_course/widget/striming_container.dart';

import '../../config/colors.dart';
import '../../config/fonts.dart';
import '../../controller/controller/home_controller.dart';

class MyCourse extends StatelessWidget {
  const MyCourse({super.key});

  @override
  Widget build(BuildContext context) {
    final myCourseController = Get.put(MyCourseController());
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
        if (myCourseController.loding.value) {
          return const Center(
            child: CircularProgressIndicator(
              color: appPrimary,
            ),
          );
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child: ListView(
            children: [
              SizedBox(
                height: size.height * 0.01,
              ),
              CourseUserContainer(size: size),
              SizedBox(
                height: size.height * 0.02,
              ),
              StrimingContaner(
                  size: size, myCourseController: myCourseController),
              SizedBox(
                height: size.height * 0.05,
              ),
              Expanded(
                  child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: myCourseController.courseModel.subjects!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2 / 5,
                    mainAxisExtent: 160,
                    crossAxisSpacing: 13,
                    mainAxisSpacing: 12),
                itemBuilder: (context, index) {
                  final data = myCourseController.courseModel.subjects![index];
                  return Column(
                    children: [
                      Image.network(
                        data.icon.toString(),
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }

                          return const Center(
                            child: CircularProgressIndicator(
                              color: appPrimary,
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.008,
                      ),
                      Text(
                        data.title.toString(),
                        style: black12W400,
                      )
                    ],
                  );
                },
              ))
            ],
          ),
        );
      }),
    );
  }
}
