import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natural_app/cubits/food_view_cubit/food_view_state.dart';

class FoodViewCubit extends Cubit<FoodViewState> {
  FoodViewCubit() : super(InitialState());

  final String foodName = '';
}
