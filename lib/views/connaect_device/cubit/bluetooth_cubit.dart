import 'package:bloc/bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:meta/meta.dart';

import '../../../services/bluetooth/obd2_plugin.dart';

part 'bluetooth_state.dart';

class BluetoothCubit extends Cubit<BluetoothState> {
  BluetoothCubit() : super(BluetoothInitial());
  bool buttonOn = false;
  final obd2 = Obd2Plugin();
  List<BluetoothDevice> devices = [];
  BluetoothDevice? device;

  bluetoothButton() async {
    if (!buttonOn) {
      buttonOn = !buttonOn;
      obd2.permitions;
      if (!(await obd2.isBluetoothEnable)) {
        await obd2.enableBluetooth;
      }
      if (!(await obd2.hasConnection)) {
        devices = await obd2.getPairedDevices;
        if (devices.isNotEmpty) {
          emit(ShowBluetoothList(devices));
        } else {
          emit(WaitingForDevices());
        }
      }
    } else {
      buttonOn = !buttonOn;
      device = null;
      obd2.disconnect();
      emit(BluetoothOff());
    }
  }

  connectToDevice(int index) async {
    obd2.getConnection(devices[index], (connection) {
      device = devices[index];
      print("connected to bluetooth device.");
      obd2.setOnDataReceived((command, response, requestCode) {
        print("$command => $response");
      });
      emit(BluetoothOn());
    }, (message) {
      print("error in connecting: $message");
    });
  }
}
