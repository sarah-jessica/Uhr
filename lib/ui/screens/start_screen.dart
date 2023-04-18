import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uhr/app_router.gr.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        AlarmClockRouter(),
        StopwatchRouter(),
        TimerRouter(),
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: FadeTransition(
            opacity: animation,
            child: child,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).backgroundColor,
            selectedItemColor: Theme.of(context).textTheme.headline1?.color,
            unselectedItemColor: Theme.of(context).textTheme.headline2?.color,
            currentIndex: tabsRouter.activeIndex,
            //landscapeLayout: BottomNavigationBarLandscapeLayout.values,
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Semantics(
                  label: tr('alarm-clock'),
                  child: const Icon(
                    Icons.alarm,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Semantics(
                  label: tr('stopwatch'),
                  child: const Icon(
                    Icons.timer_sharp,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Semantics(
                  label: tr('timer'),
                  child: const Icon(
                    Icons.hourglass_empty,
                  ),
                ),
                label: '',
              ),
            ],
          ),
        );
      },
    );
  }
}
