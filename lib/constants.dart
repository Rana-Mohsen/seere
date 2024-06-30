import 'package:flutter/material.dart';

const kPrimaryBackGroundColor = Color(0xFFEDF2FF);
const kPrimaryBlueColor = Color(0xff2F66F6);
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

BoxDecoration boxDecoration({double radius = 8}) {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(radius),
    boxShadow: [
      boxShadow(),
    ],
  );
}

BoxShadow boxShadow() {
  return BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 0,
      blurRadius: 4,
      offset: const Offset(0, 4));
}
