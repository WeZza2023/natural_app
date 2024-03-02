import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natural_app/cubits/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:natural_app/cubits/liquid_progress_indicator/liquid_progress_cubit.dart';
import 'package:natural_app/cubits/meal_view_cubit/meal_view_cubit.dart';
import 'package:natural_app/cubits/meals_list_cubit/meals_list_cubit.dart';
import 'package:natural_app/views/customize_view.dart';
import 'package:natural_app/views/food_view.dart';
import 'package:natural_app/views/home_view.dart';
import 'package:natural_app/views/meal_view.dart';

void main() {
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MealsListCubit(),
        ),
        BlocProvider(
          create: (context) => BottomNavCubit(),
        ),
        BlocProvider(
          create: (context) => LiquidProgressCubit(),
        ),
        BlocProvider(
          create: (context) => MealViewCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeView.id: (context) => const HomeView(),
          CustomizeView.id: (context) => CustomizeView(),
          MealSearchView.id: (context) => MealSearchView(),
          FoodView.id: (context) => FoodView(),
        },
        initialRoute: HomeView.id,
      ),
    );
  }
}
