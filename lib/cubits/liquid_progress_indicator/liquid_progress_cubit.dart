import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natural_app/cubits/liquid_progress_indicator/liquid_progress_state.dart';

class LiquidProgressCubit extends Cubit<LiquidProgressState> {
  LiquidProgressCubit() : super(InitialState());

  int maxValue = 2500;
  int value = 0;

  void incrementValue() {
    value += 250;
    emit(IncrementState());
  }

  void decrementValue() {
    value -= 250;
    emit(DecrementState());
  }
}
