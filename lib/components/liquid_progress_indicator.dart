import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:natural_app/constants/colors.dart';
import 'package:natural_app/cubits/liquid_progress_indicator/liquid_progress_cubit.dart';
import 'package:natural_app/cubits/liquid_progress_indicator/liquid_progress_state.dart';
import 'package:simple_shadow/simple_shadow.dart';

class LiquidProgressIndicator extends StatelessWidget {
  const LiquidProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LiquidProgressCubit>(context);
    return BlocBuilder<LiquidProgressCubit, LiquidProgressState>(
      builder: (context, state) {
        return Row(
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    cubit.incrementValue();
                    print(cubit.value);
                  },
                  icon: const Icon(
                    Icons.add_circle_outline_sharp,
                    color: KMidFontColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    cubit.decrementValue();
                    print(cubit.value);
                  },
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    color: KMidFontColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 150,
              width: 75,
              child: LiquidLinearProgressIndicator(
                animationDuration: const Duration(seconds: 3),
                value: cubit.value / cubit.maxValue,
                valueColor: const AlwaysStoppedAnimation(
                  Color(0xff6671E1),
                ),
                backgroundColor: const Color(0xffEDEFFE),
                borderColor: Colors.transparent,
                borderWidth: 5.0,
                borderRadius: 100.0,
                direction: Axis.vertical,
                center: SimpleShadow(
                  opacity: 0.3,
                  offset: const Offset(2, 2),
                  sigma: 1,
                  child: Text(
                    '${(cubit.value / cubit.maxValue) * 100} %',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
