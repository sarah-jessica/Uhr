import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uhr/app_router.gr.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
        routes: const [
          AlarmClockRouter(),
          StopwatchPage(),
          TimerPage(),
        ],
        builder: (context, child, animation) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            body: FadeTransition(
              opacity: animation,
              child: child,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) {
                tabsRouter.setActiveIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.alarm, color: Colors.black),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.timer_sharp, color: Colors.black),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.hourglass_empty, color: Colors.black),
                  label: '',
                ),
              ],
            ),
          );
        },
    );
  }
}
