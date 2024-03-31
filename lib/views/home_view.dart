import 'package:flutter/material.dart';
import 'package:seere/components/custom_button.dart';
import 'package:sizer/sizer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
          width: double.maxFinite,
          child: Image.asset(
            'assets/images/appbar.png',
            fit: BoxFit.cover,
          ),
        ),
        CustomButton(title: "Activate Paried Device", color: Color(0xff2F66F6)),
        SizedBox(
          height: 20.h,
          width: double.maxFinite,
          child: Image.asset(
            'assets/images/home_car.png',
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
