import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natural_app/components/search_item.dart';
import 'package:natural_app/components/text_form_field.dart';
import 'package:natural_app/cubits/meal_view_cubit/meal_view_cubit.dart';
import 'package:natural_app/cubits/meal_view_cubit/meal_view_state.dart';
import 'package:natural_app/cubits/meals_list_cubit/meals_list_cubit.dart';
import 'package:natural_app/cubits/meals_list_cubit/meals_list_state.dart';
import 'package:natural_app/views/food_view.dart';

class MealSearchView extends StatelessWidget {
  MealSearchView({super.key});
  static String id = 'MealSearchView';
  final formkey = GlobalKey<FormState>();

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<MealViewCubit>(context);
    return BlocBuilder<MealsListCubit, MealsListState>(
      builder: (context, state) {
        return BlocBuilder<MealViewCubit, IsMealClicked>(
          builder: (context, state) {
            return Form(
              key: formkey,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  bottom: PreferredSize(
                    preferredSize: const Size(0, 65),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 26),
                      child: defaultFormField(
                          onChange: (value) async {
                            if (formkey.currentState!.validate()) {
                              cubit.BreakfastSearch(searchController.text);
                            }
                          },
                          controller: searchController,
                          type: TextInputType.text,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return '';
                            }
                          },
                          prefix: Icons.search_rounded),
                    ),
                  ),
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                    ),
                  ),
                  centerTitle: true,
                  title: Text(
                    cubit.mealName,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: cubit.appBarColors,
                      ),
                    ),
                  ),
                ),
                backgroundColor: const Color(0xffF2F3F7),
                body: ListView.separated(
                  itemBuilder: (context, index) => SearchItem(
                    function: () async {
                      await cubit.addPressed(
                        cubit.foodNames[index],
                      );
                      // Navigator.pushNamed(context, FoodView.id);
                      showModalBottomSheet(
                          showDragHandle: true,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 25),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 80,
                                        child: Image.network(
                                            cubit.searchItem.image)),
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
                                            color:
                                                Colors.grey.withOpacity(0.31),
                                            spreadRadius: 1,
                                            blurRadius: 30,
                                          ),
                                        ],
                                      ),
                                      child: ListView.separated(
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          List<dynamic> foodDataList =
                                              cubit.getFoodModelDataList;
                                          return Container(
                                            decoration: const BoxDecoration(
                                              color: Color(0xffFFFFFF),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(12),
                                              ),
                                            ),
                                            height: 60,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 12.0, left: 12.0),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      cubit.nutrients[index],
                                                      style: const TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                    Text(
                                                      foodDataList[index]
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                  ]),
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
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
                                    )
                                  ],
                                ));
                          });
                    },
                    text: cubit.foodNames[index],
                  ),
                  separatorBuilder: (context, index) =>
                      const Divider(indent: 20, endIndent: 20),
                  itemCount: cubit.itemCount,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
