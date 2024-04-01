import 'package:flutter/material.dart';
import 'package:seere/constants.dart';
import 'package:sizer/sizer.dart';

class AppCenterContainer extends StatelessWidget {
  const AppCenterContainer(
      {super.key, required this.image, required this.lable});
  final String image;
  final String lable;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration(radius: 24),
      child: Column(
        children: [
          SizedBox(
            height: 18.h,
            width: double.infinity,
            child: Image.asset(
              image,
              // fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              lable,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 11.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
