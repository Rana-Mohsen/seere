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
  List<String> lables = ["Bluetooth", "   WiFi  "];
  List<bool> isSel = List.generate(2, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Wrap(
        children: List.generate(2, (index) {
      return ChoiceChip(
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        showCheckmark: false,
        elevation: 1,
        shadowColor: Colors.grey.withOpacity(0.5),
        padding: const EdgeInsets.all(8),
        label: Text(
          lables[index],
          style: const TextStyle(fontSize: 17, color: Colors.white),
        ),
        labelPadding: const EdgeInsets.symmetric(horizontal: 78),
        // color of selected chip
        backgroundColor: kPrimaryBlueColor,
        selectedColor: Color(0xff618BF8),
        // selected chip value
        selected: isSel[index],
        // onselected method
        onSelected: (bool selected) {
          setState(() {
            isSel.fillRange(0, 2, false);
            isSel[index] = selected;
          });
        },
      );
    }));
  }
}
