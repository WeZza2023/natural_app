import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natural_app/cubits/meals_list_cubit/meals_list_state.dart';

class MealsListCubit extends Cubit<MealsListState> {
  MealsListCubit() : super(InitialState());

  bool isBraekfastShown = true;
  bool isFirstSnackShown = true;
  bool isLunchShown = true;
  bool isSecSnackShown = false;
  bool isDinnerShown = true;
  bool isLastSnackShown = false;

  void isBraekfast() {
    isBraekfastShown = !isBraekfastShown;

    emit(IsShownMealState());
  }

  void isFirstSnack() {
    isFirstSnackShown = !isFirstSnackShown;

    emit(IsShownMealState());
  }

  void isLunch() {
    isLunchShown = !isLunchShown;

    emit(IsShownMealState());
  }

  void isSecSnack() {
    isSecSnackShown = !isSecSnackShown;

    emit(IsShownMealState());
  }

  void isDinner() {
    isDinnerShown = !isDinnerShown;

    emit(IsShownMealState());
  }

  void isLastSnack() {
    isLastSnackShown = !isLastSnackShown;

    emit(IsShownMealState());
  }
}
