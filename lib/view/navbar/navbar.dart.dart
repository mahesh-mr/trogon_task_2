import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trogon_task_2/controller/controller/bottom_navigationbar_controller.dart';
import '../../config/colors.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  // int seletedIndex = 0;
  // List page = [
  //   Home(),
  //   MyCourse(),
  //   Notificaton(),
  //   Feed(),
  // ];
  @override
  Widget build(BuildContext context) {
    final bottomNavController = Get.put(BottomNavigationBarController());
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: bottomNavController.page[bottomNavController.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            // selectedFontSize: 9.sp,
            // unselectedFontSize: 9.sp,
            selectedLabelStyle:
                GoogleFonts.inder(fontWeight: FontWeight.normal),
            unselectedLabelStyle:
                GoogleFonts.inder(fontWeight: FontWeight.bold),
            backgroundColor: appWhite,
            showSelectedLabels: true,
            selectedItemColor: appPrimary,
            unselectedItemColor: appGrey,
            currentIndex: bottomNavController.currentIndex.value,
            onTap: (newIndex) {
              bottomNavController.currentIndexChange(newIndex);
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/home.svg',
                  color: appGrey,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/home.svg',
                  color: appPrimary,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/course.svg',
                    color: appGrey,
                  ),
                  activeIcon: SvgPicture.asset(
                    'assets/course.svg',
                    color: appPrimary,
                  ),
                  label: 'My Course'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/notification.svg',
                    color: appGrey,
                  ),
                  activeIcon: SvgPicture.asset(
                    'assets/notification.svg',
                    color: appPrimary,
                  ),
                  label: 'Notification'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/feed.svg',
                    color: appGrey,
                  ),
                  activeIcon: SvgPicture.asset(
                    'assets/feed.svg',
                    color: appPrimary,
                  ),
                  label: 'Feed'),
            ]),
      );
    });
  }
}
