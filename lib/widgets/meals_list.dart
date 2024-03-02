import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natural_app/cubits/meal_view_cubit/meal_view_cubit.dart';
import 'package:natural_app/cubits/meals_list_cubit/meals_list_cubit.dart';
import 'package:natural_app/cubits/meals_list_cubit/meals_list_state.dart';
import 'package:natural_app/views/meal_view.dart';
import 'package:natural_app/components/meal_item.dart';

class MealsList extends StatelessWidget {
  MealsList({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var ListCubit = BlocProvider.of<MealsListCubit>(context);
    var mealCubit = BlocProvider.of<MealViewCubit>(context);

    return BlocBuilder<MealsListCubit, MealsListState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 30,
              ),
            ],
          ),
          height: 250,
          child: ListView.custom(
            childrenDelegate: SliverChildListDelegate(
              [
                Visibility(
                  visible: ListCubit.isBraekfastShown,
                  child: MealItem(
                    function: () {
                      mealCubit.breakfastClicked();
                      Navigator.pushNamed(context, MealSearchView.id);
                    },
                    mealName: 'Breakfast',
                    color: const [
                      Color(0xffF98D86),
                      Color(0xffFE9E8F),
                      Color(0xffFFA791),
                      Color(0xffFFAD94),
                    ],
                    mealImage: 'assets/images/breakfast.png',
                    foodList: const ['Bread', 'Apple', 'Apple'],
                    mealCalories: 525,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Visibility(
                  visible: ListCubit.isFirstSnackShown,
                  child: MealItem(
                    function: () {
                      mealCubit.snackClicked();
                      Navigator.pushNamed(context, MealSearchView.id);
                    },
                    mealName: 'Snack',
                    color: const [
                      Color(0xffFF598C),
                      Color(0xffFC7DA6),
                      Color(0xffFE86AD),
                      Color(0xffFC9CBB),
                    ],
                    mealImage: 'assets/images/snack.png',
                    foodList: const ['Bread', 'Apple', 'Apple'],
                    mealCalories: 525,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Visibility(
                  visible: ListCubit.isLunchShown,
                  child: MealItem(
                    function: () {
                      mealCubit.lunchClicked();
                      Navigator.pushNamed(context, MealSearchView.id);
                    },
                    mealName: 'Lunch',
                    color: const [
                      Color(0xff5E62DE),
                      Color(0xff6674E1),
                      Color(0xff6E80E5),
                      Color(0xff8190DD),
                    ],
                    mealImage: 'assets/images/lunch.png',
                    foodList: const ['Bread', 'Apple', 'Apple'],
                    mealCalories: 525,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Visibility(
                  visible: ListCubit.isSecSnackShown,
                  child: MealItem(
                    function: () {
                      mealCubit.snackClicked();
                      Navigator.pushNamed(context, MealSearchView.id);
                    },
                    mealName: 'Snack',
                    color: const [
                      Color(0xffFF598C),
                      Color(0xffFC7DA6),
                      Color(0xffFE86AD),
                      Color(0xffFC9CBB),
                    ],
                    mealImage: 'assets/images/snack.png',
                    foodList: const ['Bread', 'Apple', 'Apple'],
                    mealCalories: 525,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Visibility(
                  visible: ListCubit.isDinnerShown,
                  child: MealItem(
                    function: () {
                      mealCubit.dinnerClicked();
                      Navigator.pushNamed(context, MealSearchView.id);
                    },
                    mealName: 'Dinner',
                    color: const [
                      Color(0xff2B1F74),
                      Color(0xff413D94),
                      Color(0xff625EBB),
                      Color(0xff7F82D7),
                    ],
                    mealImage: 'assets/images/dinner.png',
                    foodList: const ['Bread', 'Apple', 'Apple'],
                    mealCalories: 525,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Visibility(
                  visible: ListCubit.isLastSnackShown,
                  child: MealItem(
                    function: () {
                      mealCubit.snackClicked();
                      Navigator.pushNamed(context, MealSearchView.id);
                    },
                    mealName: 'Snack',
                    color: const [
                      Color(0xffFF598C),
                      Color(0xffFC7DA6),
                      Color(0xffFE86AD),
                      Color(0xffFC9CBB),
                    ],
                    mealImage: 'assets/images/snack.png',
                    foodList: const ['Bread', 'Apple', 'Apple'],
                    mealCalories: 525,
                  ),
                ),
              ],
            ),
            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }
}
