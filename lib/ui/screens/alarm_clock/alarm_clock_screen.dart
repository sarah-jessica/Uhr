import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uhr/app_router.gr.dart';
import 'package:uhr/main.dart';
import 'package:uhr/ui/widgets/alarm_tile.dart';
import 'package:uhr/ui/widgets/clock_appbar.dart';

class AlarmClockScreen extends ConsumerStatefulWidget {
  const AlarmClockScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AlarmClockScreen> createState() => _AlarmClockScreenState();
}

class _AlarmClockScreenState extends ConsumerState<AlarmClockScreen> {
  @override
  Widget build(BuildContext context) {
    final alarmList = ref.watch(alarmListChangeNotifierProvider)
      ..updateAlarms();
    return Scaffold(
      appBar: ClockAppBar(title: 'alarm-clock-title'.tr()),
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView.builder(
        itemCount: alarmList.alarms.length,
        itemBuilder: (context, index) {
          return AlarmTile(
            alarm: alarmList.alarms[index],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: '1',
        foregroundColor: Theme.of(context).textTheme.headline1?.color,
        backgroundColor: Theme.of(context).backgroundColor,
        onPressed: () {
          context.pushRoute(const AddAlarmPage());
        },
        child: const Icon(
          Icons.add_alarm,
          size: 40,
        ),
      ),
    );
  }
}
