import 'package:flutter/material.dart';

const kPrimaryBackGroundColor = Color(0xFFEDF2FF);

BoxDecoration boxDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
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
