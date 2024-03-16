import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trogon_task_2/config/colors.dart';
import 'package:trogon_task_2/config/fonts.dart';

class BottomContaner extends StatelessWidget {
  const BottomContaner({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: size.height * 0.20,
          width: double.infinity,
          //  color: appBlack,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.15,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: appWhite,
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(color: appBrown)),
              child: Row(
                children: [
                  SizedBox(
                    height: size.height * 0.17,
                    width: size.height * 0.15,
                    // color: appYellow,
                  ),
                  SizedBox(
                    height: size.height * 0.17,
                    width: size.height * 0.24,
                    // color: appGrey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Explore',
                          style: black16W500,
                        ),
                        Text(
                          'Monthly Current\nAffairs',
                          style: brown18W600,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * 0.06,
                    width: size.width * 0.12,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 219, 219, 219)
                                .withOpacity(1),
                            offset: const Offset(4, 4),
                            blurRadius: 9,
                            spreadRadius: 1,
                          ),
                        ],
                        color: appWhite,
                        borderRadius: BorderRadius.circular(50.r)),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: appYellow,
                    ),
                  )
                  // SvgPicture.asset('assets/arrow.svg')
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 10,
          child: SizedBox(
              height: size.height * 0.17,
              width: size.width * 0.3,
              child: Image.asset('assets/books.png')),
        )
      ],
    );
  }
}
