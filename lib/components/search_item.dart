import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natural_app/cubits/meal_view_cubit/meal_view_cubit.dart';
import 'package:natural_app/cubits/meal_view_cubit/meal_view_state.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key,
    required this.text,
    required this.function,
  });
  final String text;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealViewCubit, IsMealClicked>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.only(top: 20, right: 35, left: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(text,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
              IconButton(
                onPressed: function,
                icon: const Icon(Icons.add_circle_outline_sharp),
              )
            ],
          ),
        );
      },
    );
  }
}
