import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trogon_task_2/config/colors.dart';
import 'package:trogon_task_2/config/fonts.dart';
import 'package:trogon_task_2/controller/controller/home_controller.dart';

class HomeGrid extends StatelessWidget {
  const HomeGrid({
    super.key,
    required this.homeController,
    required this.size,
  });

  final HomeController homeController;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.5,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: homeController.homeModel.topCourses!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 5,
            mainAxisExtent: size.height * 0.25,
            crossAxisSpacing: 13,
            mainAxisSpacing: 12),
        itemBuilder: (context, index) {
          return Container(
            //  color: appYellow,
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image.network(
                      homeController.homeModel.topCourses![index].thumbnail
                          .toString(),
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
                    )),
                SizedBox(
                  height: size.height * 0.008,
                ),
                Text(
                  homeController.homeModel.topCourses![index].title.toString(),
                  style: black16W500,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
