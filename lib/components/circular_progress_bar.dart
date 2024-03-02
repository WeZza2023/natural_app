import 'package:flutter/material.dart';
import 'package:natural_app/constants/colors.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CircularProgressBar extends StatelessWidget {
  const CircularProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      appearance: CircularSliderAppearance(
        size: 130,
        customColors: CustomSliderColors(
          shadowMaxOpacity: 20,
          shadowStep: 10,
          shadowColor: const Color(0xffE4E5E7),
          trackColor: const Color(0xffD4D4F0),
          dynamicGradient: true,
          progressBarColors: [
            const Color(0xff2C3AC7),
            const Color(0xff3F9CF5),
            const Color(0xff89CBFF),
          ],
        ),
        infoProperties: InfoProperties(
          modifier: (percentage) {
            return '1520';
          },
          mainLabelStyle: const TextStyle(
            fontSize: 30,
            color: Color(0xff2C3AC7),
          ),
          bottomLabelText: 'Kcal left',
          bottomLabelStyle: const TextStyle(
            fontSize: 13,
            color: KMinFontColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        startAngle: 290,
        angleRange: 320,
        animationEnabled: true,
        animDurationMultiplier: 3,
        customWidths: CustomSliderWidths(
          progressBarWidth: 13,
          trackWidth: 5,
          handlerSize: 3,
          shadowWidth: 18,
        ),
      ),
      min: 0,
      max: 3000,
      initialValue: 3000,
    );
  }
}
