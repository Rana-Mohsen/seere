import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants.dart';

class CustomChoiceChip extends StatefulWidget {
  const CustomChoiceChip({
    super.key,
  });

  @override
  State<CustomChoiceChip> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomChoiceChip> {
  Map<String, bool> enabled = {"Bluetooth": true, "WiFi": false};
  int _sel = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _button(
            name: "Bluetooth",
            onPressed: () {
              enabled['WiFi'] = false;
              enabled['Bluetooth'] = true;
              setState(() {});
            }),
        _button(
            name: "WiFi",
            onPressed: () {
              enabled['WiFi'] = true;
              enabled['Bluetooth'] = false;
              setState(() {});
            })
      ],
    );
  }

  Widget _button({required void Function()? onPressed, required String name}) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          name,
        ),
        style: TextButton.styleFrom(
            backgroundColor:
                (enabled[name] == true ? Color(0xff618BF8) : kPrimaryBlueColor),
            foregroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
      ),
    );
  }
}
