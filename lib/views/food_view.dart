import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natural_app/cubits/meal_view_cubit/meal_view_cubit.dart';
import 'package:natural_app/cubits/meal_view_cubit/meal_view_state.dart';

class FoodView extends StatelessWidget {
  FoodView({Key? key}) : super(key: key);

  static String id = 'FoodView';

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<MealViewCubit>(context);

    return BlocBuilder<MealViewCubit, IsMealClicked>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xffF2F3F7),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 30,
                  ),
                ],
                color: const Color(0xffFFFFFF),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 80,
                      child: Image.network(cubit.searchItem.image)),
                  Row(
                    children: [
                      Text(
                        cubit.searchItem.name,
                        style: const TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.31),
                          spreadRadius: 1,
                          blurRadius: 30,
                        ),
                      ],
                    ),
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        List<dynamic> foodDataList = cubit.getFoodModelDataList;
                        return Container(
                          decoration: const BoxDecoration(
                            color: Color(0xffFFFFFF),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          height: 60,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 12.0, left: 12.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    cubit.nutrients[index],
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    foodDataList[index].toString(),
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ]),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 12,
                      ),
                      itemCount: cubit.nutrients.length,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    height: 100,
                    child: FloatingActionButton(
                      onPressed: () {},
                      child: const Text('Add'),
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
