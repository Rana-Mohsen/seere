import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart'
    hide BluetoothState;
import 'package:seere/constants.dart';
import 'package:seere/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

import '../../services/bluetooth/obd2_plugin.dart';
import 'cubit/bluetooth_cubit.dart';

class Bluetooth extends StatefulWidget {
  const Bluetooth({super.key});

  @override
  State<Bluetooth> createState() => _BluetoothState();
}

class _BluetoothState extends State<Bluetooth> {
  final obd2 = Obd2Plugin();
  //List<BluetoothDevice>? devices;
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<BluetoothCubit>(context);

    return Column(
      children: [
        SizedBox(
          height: 3.h,
        ),
        CustomButton(
          onPressed: () async {
            await bloc.bluetoothButton();
          },
          title: bloc.buttonOn ? "Disconnect" :"Search Bluetooth Devices",
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
        BlocConsumer<BluetoothCubit, BluetoothState>(
          listener: (context, state) {
            if (state is ShowBluetoothList) {
              showBluetoothList(context, state.devices);
            }
          },
          builder: (context, state) {
            if (state is WaitingForDevices) {
              return CircularProgressIndicator();
            }
            if (state is BluetoothOn) {
              return Text(bloc.device!.name!);
            } else {
              return Text("None");
            }
          },
        )
      ],
    );
  }
}

Future<void> showBluetoothList(
    BuildContext context, List<BluetoothDevice> devices) async {
  // List<BluetoothDevice> devices = await obd2plugin.getPairedDevices;
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
                    onPressed: () async {
                      await BlocProvider.of<BluetoothCubit>(context)
                          .connectToDevice(index);
                      Navigator.pop(builder);
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
