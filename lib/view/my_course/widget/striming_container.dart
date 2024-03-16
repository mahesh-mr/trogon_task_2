import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trogon_task_2/config/colors.dart';
import 'package:trogon_task_2/config/fonts.dart';

import '../../../controller/controller/my_course_controller.dart';

class StrimingContaner extends StatelessWidget {
  const StrimingContaner({
    super.key,
    required this.size,
    required this.myCourseController,
  });

  final Size size;
  final MyCourseController myCourseController;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height * 0.14,
        width: double.infinity,
        decoration: BoxDecoration(
          color: appDarkBlue,
          borderRadius: BorderRadius.circular(
            20.r,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            3,
            (index) => Container(
              height: size.height * 0.08,
              width: size.width * 0.19,
              child: Column(
                children: [
                  Image.asset(
                    myCourseController.imageSliders[index],
                    height: size.height * 0.05,
                    width: size.width * 0.14,
                    
                  ),
                  Text(
                    myCourseController.strings[index],
                    style: black12W400,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
