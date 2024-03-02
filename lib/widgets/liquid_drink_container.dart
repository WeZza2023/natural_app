import 'package:flutter/material.dart';
import 'package:natural_app/constants/colors.dart';
import 'package:natural_app/components/liquid_progress_indicator.dart';

class LiquidDrinkContainer extends StatelessWidget {
  const LiquidDrinkContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(24),
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
          bottomLeft: Radius.circular(12),
          topLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
          topRight: Radius.circular(60),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text(
                      '1500 ',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2C3AC7),
                      ),
                    ),
                    Text(
                      'ml',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2C3AC7),
                      ),
                    ),
                  ],
                ),
                const Text(
                  'of daily goal 2.5L',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: KMidFontColor,
                  ),
                ),
                Divider(
                  height: 40,
                  color: Colors.grey.shade200,
                  thickness: 1.5,
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      color: KMinFontColor,
                    ),
                    Text(
                      ' Last drink 8.25 AM',
                      style: TextStyle(
                        color: KMinFontColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Column(
            children: [
              LiquidProgressIndicator(),
            ],
          ),
        ],
      ),
    );
  }
}
