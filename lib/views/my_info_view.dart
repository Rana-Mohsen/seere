import 'dart:math';

import 'package:flutter/material.dart';
import 'package:seere/constants.dart';
import 'package:sizer/sizer.dart';

class MyInfoView extends StatelessWidget {
  const MyInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: 25.h,
            width: double.maxFinite,
            child: Image.asset(
              'assets/images/info_app_bar.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 7.h,
            left: 6.w,
            child: Container(
              height: 14.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                "assets/images/app_icon.png",
                width: 20.w,
              ),
            ),
          ),
          Positioned(
            top: 18.h,
            width: 100.w,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Container(
                    height: 15.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                          color: const Color(0xff042877), width: 0.3.sp),
                      boxShadow: [boxShadow()],
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/info_car.png",
                          width: 45.w,
                        ),
                        Text(
                          "Car Name",
                          style: TextStyle(
                            fontFamily: "inter",
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Image.asset("assets/images/info_app_bar.png"),
        ],
      ),
    );
  }
}
