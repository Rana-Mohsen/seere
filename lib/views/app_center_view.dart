import 'package:flutter/material.dart';
import 'package:seere/components/app_center_container.dart';
import 'package:sizer/sizer.dart';

class AppCenterView extends StatelessWidget {
  const AppCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Application Center",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15.sp,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            AppCenterContainer(
              image: 'assets/images/center_car.png',
              lable: "Iso car model 1570",
            ),
          ],
        ),
      ),
    );
  }
}
