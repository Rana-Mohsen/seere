import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seere/views/connect_device/cubit/connect_device_cubit.dart';
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
  @override
  Widget build(BuildContext context) {
    //String name = BlocProvider.of<ConnectDeviceCubit>(context).name;
    return Row(
      children: [
        _button(
            name: "Bluetooth",
            onPressed: () {
              BlocProvider.of<ConnectDeviceCubit>(context).enabled['WiFi'] = false;
              BlocProvider.of<ConnectDeviceCubit>(context).enabled['Bluetooth'] = true;
              BlocProvider.of<ConnectDeviceCubit>(context).name = "Bluetooth";
              BlocProvider.of<ConnectDeviceCubit>(context).changeState();

              setState(() {});
            }),
        _button(
            name: "WiFi",
            onPressed: () {
              BlocProvider.of<ConnectDeviceCubit>(context).enabled['WiFi'] = true;
              BlocProvider.of<ConnectDeviceCubit>(context).enabled['Bluetooth'] = false;
              BlocProvider.of<ConnectDeviceCubit>(context).name = "WiFi";
              BlocProvider.of<ConnectDeviceCubit>(context).changeState();

              setState(() {});
            })
      ],
    );
  }

  Widget _button({required void Function()? onPressed, required String name}) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor:
                (BlocProvider.of<ConnectDeviceCubit>(context).enabled[name] == true ? const Color(0xff618BF8) : kPrimaryBlueColor),
            foregroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
        child: Text(
          name,
        ),
      ),
    );
  }
}
