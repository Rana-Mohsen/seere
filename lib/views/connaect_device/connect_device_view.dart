import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seere/models/car_data.dart';
import 'package:seere/widgets/custom_button.dart';
import 'package:seere/views/connaect_device/cubit/connect_device_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/custon_choice_chip.dart';
import '../../constants.dart';
import '../../utils/validators.dart';
import '../../services/socket.dart';

class ConnectDeviceView extends StatefulWidget {
  const ConnectDeviceView({super.key});

  @override
  State<ConnectDeviceView> createState() => _ConnectDeviceViewState();
}

class _ConnectDeviceViewState extends State<ConnectDeviceView> {
  final _formKey = GlobalKey<FormState>();
  String ipAddress = "";
  String port = "";
  final ipController = TextEditingController();
  final portController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // You can set an initial value for the TextField here.
    ipController.text = ipAddress;
    portController.text = port;
  }

  // void _submitForm(BuildContext context) {
  //   if (_formKey.currentState!.validate()) {
  //     // Form is valid, perform your action (e.g., connect to server)
  //     connectToServer(ip: ipAddress!, port: int.parse(port!)).then((connected) {
  //       if (connected) {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //             const SnackBar(content: Text("connected to device")));
  //       } else {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //             const SnackBar(content: Text("Failed to connect to device")));
  //       }
  //     });
  //   }
  // }

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
            controller: ipController,
            validator: validateIpAddress,
            onsaved: (value) {
              ipAddress = value!;
            },
          ),
          text("Port"),
          textField(
            controller: portController,
            validator: validatePort,
            onsaved: (value) {
              port = value!;
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return FutureBuilder<Socket>(
                      future:
                          connectToServer(ip: ipAddress, port: int.parse(port)),
                      builder: (BuildContext context,
                          AsyncSnapshot<Socket> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return AlertDialog(
                            backgroundColor: Colors.black,
                            content: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return AlertDialog(
                            content: Text('Error: ${snapshot.error}'),
                          );
                        } else {
                          reciveData();
                          Future.delayed(Duration(seconds: 30), () {
                            print("3##########");
                            for (var d in cardata) {
                              print(d);
                            }
                            ;
                          });
                          return AlertDialog(
                            content: Text('Connected to the server'),
                          );
                        }
                      },
                    );
                  },
                );
              }
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
      required Function(String?)? onsaved,
      required TextEditingController controller}) {
    return TextFormField(
      validator: validator,
      controller: controller,
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
