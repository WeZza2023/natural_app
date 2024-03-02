import 'package:flutter/material.dart';
import 'package:natural_app/constants/colors.dart';
import 'package:natural_app/components/circular_progress_bar.dart';

class MainNutrientsContainer extends StatelessWidget {
  const MainNutrientsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    color: const Color(0xffC3CEEE),
                    height: 60,
                    width: 2,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Eaten',
                        style: TextStyle(
                          fontSize: 18,
                          color: KMinFontColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/eaten.png',
                            height: 25,
                            width: 25,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            '1480',
                            style: TextStyle(
                              fontSize: 18,
                              color: KMainFontColor,
                            ),
                          ),
                          const Text(
                            '  Kcal',
                            style: TextStyle(
                              fontSize: 13,
                              color: KMinFontColor,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const CircularProgressBar(),
            ],
          ),
          Divider(
            height: 40,
            color: Colors.grey.shade200,
            thickness: 1.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Carbs',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: KMainFontColor,
                    ),
                  ),
                  Container(
                    width: 75,
                    height: 5,
                    child: const LinearProgressIndicator(
                      backgroundColor: Color(0xffE6EDFA),
                      color: Color(0xffA6B9EE),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      value: 10 / 20,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Protein',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: KMainFontColor,
                    ),
                  ),
                  Container(
                    width: 75,
                    height: 5,
                    child: const LinearProgressIndicator(
                      backgroundColor: Color(0xffFDE3E9),
                      color: Color(0xffF89AB7),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      value: 1 / 20,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Fats',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: KMainFontColor,
                    ),
                  ),
                  Container(
                    width: 75,
                    height: 5,
                    child: const LinearProgressIndicator(
                      backgroundColor: Color(0xffFCF0DB),
                      color: Color(0xffF6CC7D),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      value: 1 / 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
