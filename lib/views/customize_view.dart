import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natural_app/cubits/meals_list_cubit/meals_list_cubit.dart';

class CustomizeView extends StatelessWidget {
  CustomizeView({super.key});
  static String id = 'CustomizeView';

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<MealsListCubit>(context);

    return Scaffold(
      body: Column(children: [
        IconButton(
          onPressed: () {
            cubit.isBraekfast();
          },
          icon: Icon(Icons.abc),
        ),
        IconButton(
          onPressed: () {
            cubit.isFirstSnack();
          },
          icon: Icon(Icons.abc),
        ),
        IconButton(
          onPressed: () {
            cubit.isLunch();
          },
          icon: Icon(Icons.abc),
        ),
        IconButton(
          onPressed: () {
            cubit.isSecSnack();
          },
          icon: Icon(Icons.abc),
        ),
        IconButton(
          onPressed: () {
            cubit.isDinner();
          },
          icon: Icon(Icons.abc),
        ),
        IconButton(
          onPressed: () {
            cubit.isLastSnack();
          },
          icon: Icon(Icons.abc),
        ),
      ]),
    );
  }
}
