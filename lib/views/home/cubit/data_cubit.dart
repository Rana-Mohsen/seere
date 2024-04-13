import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'data_state.dart';

class DataCubit extends Cubit<Map<String, dynamic>> {
  DataCubit() : super({});

  void updateData(String pid, dynamic value) {
      Map<String, dynamic> newState = Map.from(state);
    newState[pid] = value;
    emit(newState);
  }
}