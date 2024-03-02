import 'package:flutter/material.dart';
import 'package:natural_app/constants/colors.dart';
import 'package:natural_app/views/customize_view.dart';
import 'package:natural_app/widgets/liquid_drink_container.dart';
import 'package:natural_app/widgets/main_nutrients_container.dart';
import 'package:natural_app/widgets/meals_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const MainNutrientsContainer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Meals today',
                  style: TextStyle(
                    color: KMidFontColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          CustomizeView.id,
                        );
                      },
                      child: const Text(
                        'Customize',
                        style: TextStyle(
                          color: Color(0xff2C3AC7),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_rounded,
                      color: KMainFontColor,
                      size: 20,
                    ),
                  ],
                ),
              ],
            ),
            MealsList(),
            LiquidDrinkContainer(),
          ],
        ),
      ),
    );
  }
}
