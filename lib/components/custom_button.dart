import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../views/connaect_device/connect_device_view.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.color, this.width = 58});
  final String title;
  final Color color;
  final int width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.h,
      width: width.w,
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ConnectDeviceView()));
          },
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(color),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)))),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          )),
    );
  }
}
