import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natural_app/constants/colors.dart';
import 'package:natural_app/cubits/meal_view_cubit/meal_view_state.dart';
import 'package:natural_app/models/food_model.dart';
import 'package:natural_app/services/search_food_service.dart';

class MealViewCubit extends Cubit<IsMealClicked> {
  MealViewCubit() : super(InitialState());

  List<Color> appBarColors = [Colors.transparent];
  String mealName = '';

  int itemCount = 0;
  List<dynamic> foodNames = [];
  var autoSearchService = AutoSearchService();
  var searchFoodService = SearchFoodService();
  late FoodModel searchItem;
  List<String> nutrients = [
    'Weight',
    'Calories',
    'Total Fat',
    'Saturated Fat',
    'Protin',
    'Carbs',
    'Cholesterol',
    'Sodium',
    'Fiber',
    'Sugars',
    'Potassium',
  ];

  List<dynamic> getFoodModelDataList = [];

  void breakfastClicked() {
    appBarColors = breakfastColors;
    mealName = 'Breakfast';
    emit(IsBreakfastClicked());
  }

  Future<void> BreakfastSearch(String foodItem) async {
    var searchResult = await autoSearchService.foodSearch(
      foodItem: foodItem,
    );
    foodNames = searchResult.foodNames;
    itemCount = foodNames.length;
    emit(BreakfastSearchSuccess());
  }

  Future<void> addPressed(String foodItem) async {
    searchItem = await searchFoodService.foodSearch(foodItem: foodItem);
    getFoodModelDataList = [
      searchItem.weight,
      searchItem.calories,
      searchItem.totalFat,
      searchItem.saturatedFat,
      searchItem.protin,
      searchItem.carbs,
      searchItem.cholesterol,
      searchItem.sodium,
      searchItem.fiber,
      searchItem.sugars,
      searchItem.potassium,
    ];

    emit(ItemLoadedState());
  }

  void lunchClicked() {
    appBarColors = lunchColors;
    mealName = 'Lunch';
    emit(IsLunchClicked());
  }

  void dinnerClicked() {
    appBarColors = dinnerColors;
    mealName = 'Dinner';
    emit(IsLunchClicked());
  }

  void snackClicked() {
    appBarColors = SnackColors;
    mealName = 'Snack';
    emit(IsLunchClicked());
  }
}
