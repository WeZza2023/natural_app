import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natural_app/cubits/bottom_nav_cubit/bottom_nav_state.dart';
import 'package:natural_app/layers/one.dart';
import 'package:natural_app/layers/home_view_body.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(InitialState());
  int currentIndex = 0;

  List<Widget> bottomScreens = [
    const HomeViewBody(),
    const one(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(IsBottomNavChangeState());
  }
}
