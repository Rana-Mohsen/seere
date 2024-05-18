import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:meta/meta.dart';
import 'package:seere/views/home/cubit/data_cubit.dart';

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

  connectToDevice(int index, DataCubit dataCubit) async {
    obd2.getConnection(devices[index], (connection) {
      device = devices[index];
      print("connected to bluetooth device.");
      obd2.setOnDataReceived((command, response, requestCode) {
        print(response);

        updateData(response, dataCubit);
      });
      sendRequiests();
      emit(BluetoothOn());
    }, (message) {
      print("error in connecting: $message");
    });
  }

  sendRequiests() async {
    while (send) {
      await Future.delayed(
          Duration(milliseconds: await obd2.getParamsFromJSON(paramJSON)),
          () {});
    }
  }

  updateData(response, DataCubit dataCubit) {
    List<dynamic> responseData = json.decode(response);
    String resp;
    for (var data in responseData) {
       resp = data["response"];
      if (resp == "0.0") {
        continue;
      }
      if (resp.contains('.')) {
        resp = double.parse(resp).toStringAsFixed(1);
      }

      String name = mapRespNameToRequistedData(data["title"]),
          value = resp; //+ data["unit"]
      dataCubit.updateDataBlue(name, value);
    }
    //print(requistedData);
  }

  String mapRespNameToRequistedData(String name) {
    switch (name) {
      case 'Engine Coolant Temp':
        return 'engineCoolantTemp';
      case 'Engine Load':
        return 'engineLoad';
      case 'Engine RPM':
        return 'engineRPM';
      case 'Air Intake Temp':
        return 'airintakeTemp';
      case 'Speed':
        return 'speed';
      case 'Short Term Fuel Bank':
        return 'shortTermFuelBank1';
      case 'Throttle Position':
        return 'throttlePosition';
      case 'Timing Advance':
        return 'timingAdvance';
    }

    return "";
  }
}
