import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../config/colors.dart';
import '../../../config/fonts.dart';
import '../../../controller/controller/my_course_controller.dart';

class CourseUserContainer extends StatelessWidget {
  const CourseUserContainer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final myCourseController = Get.put(MyCourseController());
    return Stack(
      children: [
        SizedBox(
          height: size.height * 0.28,
          width: double.infinity,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.22,
              width: double.infinity,
              decoration: BoxDecoration(
                color: appWhite,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good Morning',
                      style: black18W600,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      myCourseController.courseModel.userdata!.name.toString(),
                      style: black18W600,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Container(
                      height: size.height * 0.065,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: appContainer,
                          borderRadius: BorderRadius.circular(
                            30.r,
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Digital Marketing Certification',
                            style: black12W400,
                          ),
                          Container(
                              height: size.height * 0.04,
                              width: size.width * 0.2,
                              decoration: BoxDecoration(
                                  color: appPrimary,
                                  borderRadius: BorderRadius.circular(
                                    30.r,
                                  )),
                              child: Center(
                                child: Text(
                                  'Change',
                                  style: white12W400,
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 20,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.r),
            child: SizedBox(
                height: size.height * 0.11,
                width: size.width * 0.216,
                child: Image.network(
                    myCourseController.courseModel.userdata!.image.toString())),
          ),
        )
      ],
    );
  }
}
