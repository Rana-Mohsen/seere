import 'package:flutter/material.dart';
import 'package:seere/constants.dart';
import 'package:sizer/sizer.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer(
      {super.key,
      required this.data,
      required this.text1,
      required this.text2,
      required this.text3});
  final String data, text1, text2, text3;

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: boxDecoration(),
        height: 18.h,
        width: 43.w,
        child: Column(
          children: [
            Text(widget.data + widget.text1),
            Text(
              widget.text2,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 10.sp,
              ),
            ),
            Text(widget.text3)
          ],
        ));
  }
}
