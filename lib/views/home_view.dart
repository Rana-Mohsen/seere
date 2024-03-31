import 'package:flutter/material.dart';
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
            "images/appbar.png",
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
