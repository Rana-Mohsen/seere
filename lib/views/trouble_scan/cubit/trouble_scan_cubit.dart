import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seere/utils/initialize_car_data.dart';

part 'trouble_scan_state.dart';

class TroubleScanCubit extends Cubit<TroubleScanState> {
  TroubleScanCubit() : super(TroubleScanInitial());
  initialState() {
    if (dtcCodes == null) {
      emit(TroubleScanInitial());
    }
  }

  buttonPressed() async {
    emit(RequistDtc());
    await Future.delayed(const Duration(milliseconds: 1500));

    if (dtcCodes!.length == 0) {
      emit(DtcResultNeg());
    } else {
      emit(DtcResultPos());
    }
  }
}
