import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seere/components/custom_button.dart';
import 'package:seere/views/connaect_device/cubit/connect_device_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../components/custon_choice_chip.dart';
import '../../constants.dart';

class ConnectDeviceView extends StatefulWidget {
  const ConnectDeviceView({super.key});

  @override
  State<ConnectDeviceView> createState() => _ConnectDeviceViewState();
}

class _ConnectDeviceViewState extends State<ConnectDeviceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Connectivity")),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomChoiceChip(),
              BlocBuilder<ConnectDeviceCubit, ConnectDeviceState>(
                  builder: (context, state) {
                if (state is ConnectDeviceWifi) {
                  return wifi();
                } else {
                  return Text("Bluetooth");
                }
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget wifi() {
    return Form(
      child: Column(
        children: [
          text("IP address"),
          textField(),
          text("Port"),
          textField(),
          SizedBox(
            height: 20.h,
          ),
          const CustomButton(
            title: "Connect",
            color: kPrimaryBlueColor,
            width: 90,
          )
        ],
      ),
    );
  }

  Widget text(String lable) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          lable,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
        ),
      ),
    );
  }

  Widget textField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      cursorColor: kPrimaryBlueColor,
      decoration: const InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
        color: kPrimaryBlueColor,
      ))),
    );
  }
}
