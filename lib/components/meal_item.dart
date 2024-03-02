import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.color,
    required this.mealName,
    required this.mealImage,
    required this.foodList,
    required this.mealCalories,
    required this.function,
  });
  final String mealName;
  final List<Color> color;
  final String mealImage;
  final List<String> foodList;
  final int mealCalories;
  final Function() function;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 30,
          ),
          child: GestureDetector(
            onTap: function,
            child: Container(
              width: 140,
              height: 220,
              padding: const EdgeInsets.only(left: 24, top: 70),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: color,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  topLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                  topRight: Radius.circular(60),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mealName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '$foodList',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          '$mealCalories',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        const Text(
                          'Kcal',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SimpleShadow(
          opacity: 0.25,
          offset: const Offset(5, 5),
          sigma: 9,
          child: Image.asset(
            mealImage,
          ),
        ),
      ],
    );
  }
}
