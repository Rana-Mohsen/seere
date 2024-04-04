part of 'connect_device_cubit.dart';

@immutable
abstract class ConnectDeviceState {}

class ConnectDeviceInitial extends ConnectDeviceState {}

class ConnectDeviceBluetooth extends ConnectDeviceState {}

class ConnectDeviceWifi extends ConnectDeviceState {}
