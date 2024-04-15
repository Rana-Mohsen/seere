import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:seere/constants.dart';
import 'package:seere/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

import '../../services/bluetooth/obd2_plugin.dart';

class Bluetooth extends StatefulWidget {
  const Bluetooth({super.key});

  @override
  State<Bluetooth> createState() => _BluetoothState();
}

class _BluetoothState extends State<Bluetooth> {
  final obd2 = Obd2Plugin();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 3.h,
        ),
        CustomButton(
          onPressed: () async {
            obd2.permitions;
            if (!(await obd2.isBluetoothEnable)) {
              await obd2.enableBluetooth;
            }
            if (!(await obd2.hasConnection)) {
              await showBluetoothList(context, obd2);
            }
          },
          title: "Search Bluetooth Devices",
          color: kPrimaryBlueColor,
          width: 70,
        ),
        SizedBox(
          height: 3.h,
        ),
        const Divider(
          color: Colors.black54,
          height: 0,
        ),
      ],
    );
  }
}

Future<void> showBluetoothList(
    BuildContext context, Obd2Plugin obd2plugin) async {
  List<BluetoothDevice> devices = await obd2plugin.getPairedDevices;
  if (ModalRoute.of(context)?.isCurrent ?? false) {
    // Check if the current context is still mounted
    showModalBottomSheet(
        backgroundColor: kPrimaryBackGroundColor,
        context: context,
        builder: (builder) {
          return Container(
            padding: const EdgeInsets.only(top: 0),
            width: double.infinity,
            height: devices.length * 50,
            child: ListView.builder(
              itemCount: devices.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      obd2plugin.getConnection(devices[index], (connection) {
                        print("connected to bluetooth device.");
                        Navigator.pop(builder);
                      }, (message) {
                        print("error in connecting: $message");
                        Navigator.pop(builder);
                      });
                    },
                    child: Center(
                      child: Text(
                        devices[index].name.toString(),
                        style: const TextStyle(color: kPrimaryBlueColor),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
}
