import 'package:flutter/material.dart';

const kPrimaryBackGroundColor = Color(0xFFEDF2FF);
const kPrimaryBlueColor = Color(0xff2F66F6);

BoxDecoration boxDecoration({double radius = 8}) {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(radius),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 0,
        blurRadius: 4,
        offset: const Offset(0, 4),
      ),
    ],
  );
}
