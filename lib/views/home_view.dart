import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natural_app/constants/colors.dart';
import 'package:natural_app/cubits/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:natural_app/cubits/bottom_nav_cubit/bottom_nav_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    List iconList = <IconData>[
      Icons.menu_book_rounded,
      Icons.person_outline,
    ];
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xffF2F3F7),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                'My Diary',
                style: TextStyle(
                  color: KMainFontColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          body: BlocProvider.of<BottomNavCubit>(context).bottomScreens[
              BlocProvider.of<BottomNavCubit>(context).currentIndex],
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 30,
                  offset: const Offset(5, 8),
                ),
              ],
              gradient: const LinearGradient(colors: [
                Color(0xff5E62DE),
                Color(0xff6674E1),
                Color(0xff6E80E5),
                Color(0xff8190DD),
              ]),
              color: Colors.amber,
              shape: BoxShape.circle,
            ),
            child: FloatingActionButton(
              onPressed: () {},
              foregroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              elevation: 0,
              splashColor: const Color(0xff2F56D2),
              shape: const CircleBorder(),
              child: const Icon(
                Icons.add,
              ),
            ),
          ),
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: iconList.length,
            tabBuilder: (int index, bool isActive) {
              return Icon(
                iconList[index],
                size: 30,
                color: const Color(0xff7F82D7),
              );
            },
            splashColor: const Color(0xff788BDE),
            splashSpeedInMilliseconds: 500,
            activeIndex: BlocProvider.of<BottomNavCubit>(context).currentIndex,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.softEdge,
            leftCornerRadius: 32,
            rightCornerRadius: 32,
            onTap: (index) {
              BlocProvider.of<BottomNavCubit>(context).changeBottom(index);
            },
          ),
        );
      },
    );
  }
}
