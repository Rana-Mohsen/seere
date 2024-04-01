import 'package:flutter/material.dart';
import 'package:seere/constants.dart';
import 'package:sizer/sizer.dart';

class AppCenterContainer extends StatelessWidget {
  const AppCenterContainer(
      {super.key,
      required this.image,
      required this.lable,
      required this.imgSize,
      required this.hight,
      required this.width});
  final String image;
  final String lable;
  final int imgSize;
  final double hight;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: hight,
      width: width,
      decoration: boxDecoration(radius: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: imgSize.h,
            width: double.infinity,
            child: Image.asset(
              image,
              // fit: BoxFit.cover,
            ),
          ),
          Text(
            lable,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 11.sp,
            ),
          ),
        ],
      ),
    );
  }
}
