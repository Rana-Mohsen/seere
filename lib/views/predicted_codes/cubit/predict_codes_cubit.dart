import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'predict_codes_state.dart';

class PredictCodesCubit extends Cubit<PredictCodesState> {
  PredictCodesCubit() : super(PredictCodesInitial());
  addCode() {
    emit(AddPredictCodesInitial());
  }
}
