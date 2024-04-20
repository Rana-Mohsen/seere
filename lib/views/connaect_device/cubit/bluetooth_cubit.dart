import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:meta/meta.dart';

import '../../../services/bluetooth/obd2_plugin.dart';
import '../../../utils/initialize_car_data.dart';

part 'bluetooth_state.dart';

class BluetoothCubit extends Cubit<BluetoothState> {
  BluetoothCubit() : super(BluetoothInitial());
  bool buttonOn = false;
  final obd2 = Obd2Plugin();
  List<BluetoothDevice> devices = [];
  BluetoothDevice? device;
  bool send = true;
  Map<String, dynamic> requistedData = {
    "engineCoolantTemp": "",
    "engineLoad": "",
    "engineRPM": "",
    "airintakeTemp": "",
    "speed": "",
    "shortTermFuelBank1": "",
    "throttlePosition": "",
    "timingAdvance": "",
  };

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
      send = false;
      obd2.disconnect();
      emit(BluetoothOff());
    }
  }

  connectToDevice(int index) async {
    obd2.getConnection(devices[index], (connection) {
      device = devices[index];
      print("connected to bluetooth device.");
      obd2.setOnDataReceived((command, response, requestCode) {
        updateData(response);
      });
      sendRequiests();
      emit(BluetoothOn());
    }, (message) {
      print("error in connecting: $message");
    });
  }

  sendRequiests() async {
    while (send) {
      print("loop");

      await Future.delayed(
          Duration(milliseconds: await obd2.getParamsFromJSON(paramJSON)),
          () {});
    }
  }

  updateData(response) {
    List<dynamic> responseData = json.decode(response);
    String resp;
    for (var data in responseData) {
      resp = data["response"];
      if (resp.contains('.')) {
        resp = double.parse(resp).toStringAsFixed(1);
      }
      requistedData[data["title"]] = resp + data["unit"];
    }

    print(requistedData);
  }
}
