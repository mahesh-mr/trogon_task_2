import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trogon_task_2/config/colors.dart';
import 'package:trogon_task_2/controller/controller/home_controller.dart';

class CarocelSliderWidget extends StatelessWidget {
  const CarocelSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final homeController = Get.put(HomeController());
//slider//

    final List<Widget> imageSliders = homeController.homeModel.adBanner!
        .map(
          (item) => SizedBox(
            height: size.height * 0.2,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(15.r),
              ),
              child: Image.network(
                item.image.toString(),
                fit: BoxFit.cover,
                width: size.width,
                loadingBuilder: (context, child, loadingProgress) {

                  if (loadingProgress==null) {
                    return child;
                  }

                   return const Center(
            child: CircularProgressIndicator(
              color: appPrimary,
            ),
          );
           
               
                },

                errorBuilder: (context, error, stackTrace) => Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Image.asset("assets/carosel.png"),
                ),
              ),
            ),
          ),
        )
        .toList();

    return Obx(() {
      return Container(
        height: size.height * 0.24,
        width: double.infinity,
        child: Center(
          child: Stack(
            children: [
              CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: size.height * 0.20,
                  enableInfiniteScroll: true,
                  onPageChanged: (index, reason) {
                    homeController.changeCarocelIndex(index);
                  },
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                ),
              ),
              Positioned(
                bottom: size.height * 0.007,
                left: size.width * 0.4,
                child: Container(
                  height: size.height * 0.015,
                  width: size.width * 0.15,
                  child: AnimatedSmoothIndicator(
                    activeIndex: homeController.currentCarocelIndex.value,
                    count: imageSliders.length,
                    effect: ExpandingDotsEffect(
                        activeDotColor: appYellow,
                        dotColor: appWhite,
                        dotHeight: size.height * 0.009,
                        dotWidth: size.width * 0.017,
                        spacing: 2),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
