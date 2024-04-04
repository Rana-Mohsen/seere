import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'connect_device_state.dart';

class ConnectDeviceCubit extends Cubit<ConnectDeviceState> {
  ConnectDeviceCubit() : super(ConnectDeviceInitial());
  String name = "Bluetooth";

  changeState() {
    if (name == "Bluetooth") {
      emit(ConnectDeviceBluetooth());
    } else if (name == "WiFi") {
      emit(ConnectDeviceWifi());
    }
  }
}
