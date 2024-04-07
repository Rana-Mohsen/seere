import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seere/components/custom_button.dart';
import 'package:seere/views/connaect_device/cubit/connect_device_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../components/custon_choice_chip.dart';
import '../../constants.dart';
import '../../services/socket.dart';

class ConnectDeviceView extends StatefulWidget {
  const ConnectDeviceView({super.key});

  @override
  State<ConnectDeviceView> createState() => _ConnectDeviceViewState();
}

class _ConnectDeviceViewState extends State<ConnectDeviceView> {
  final _formKey = GlobalKey<FormState>();
  String? ipAddress;
  String? port;
  String? validateIpAddress(String? value) {
    final ipAddressRegExp = RegExp(
      r'^(\d{1,3}\.){3}\d{1,3}$',
    );
    if (!ipAddressRegExp.hasMatch(value!)) {
      return 'Enter a valid IP address';
    }

    final segments = value!.split('.');
    for (final segment in segments) {
      final intValue = int.tryParse(segment);
      if (intValue == null || intValue < 0 || intValue > 255) {
        return 'Enter a valid IP address';
      }
    }
    return null; // Valid IP address
  }

  String? validatePort(String? value) {
    final port = int.tryParse(value!);
    if (port == null || port < 1 || port > 65535) {
      return 'Enter a valid port number (1-65535)';
    }
    return null; // Valid port number
  }

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Form is valid, perform your action (e.g., connect to server)
       connectToServer(ip: ipAddress!, port: int.parse(port!)).then((connected) {
      if (connected) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("connected to device")));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Failed to connect to device")));
      }
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Connectivity",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const CustomChoiceChip(),
                BlocBuilder<ConnectDeviceCubit, ConnectDeviceState>(
                    builder: (context, state) {
                  if (state is ConnectDeviceWifiState) {
                    return wifi();
                  } else {
                    return Text("Bluetooth");
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget wifi() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          text("IP address"),
          textField(
            validator: validateIpAddress,
            onsaved: (value) {
              ipAddress = value;
            },
          ),
          text("Port"),
          textField(
            validator: validatePort,
            onsaved: (value) {
              port = value;
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomButton(
            onPressed: () {
              _submitForm(context);
            },
            title: "Connect",
            color: kPrimaryBlueColor,
            width: 90,
          ),
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

  Widget textField(
      {required String? Function(String?)? validator,
      required Function(String?)? onsaved}) {
    return TextFormField(
      validator: validator,
      onChanged: onsaved,
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
