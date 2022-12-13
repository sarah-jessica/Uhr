import 'package:flutter/material.dart';
import 'package:uhr/ui/screens/alarm_clock/add_alarm_screen.dart';
import 'package:uhr/ui/widgets/alarm_tile.dart';
import 'package:uhr/provider/alarm_clock/myalarmlist_provider.dart';
import 'package:provider/provider.dart';
import 'package:uhr/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';

class AlarmClockScreen extends StatefulWidget {
  const AlarmClockScreen({Key? key}) : super(key: key);

  @override
  State<AlarmClockScreen> createState() => _AlarmClockScreenState();
}

class _AlarmClockScreenState extends State<AlarmClockScreen> {
  @override
  Widget build(BuildContext context) {

    return Consumer<MyAlarmList>(
        builder: (context, myAlarmList, child) {
          myAlarmList.updateAlarms();
          return Scaffold(
            backgroundColor: Colors.white,
            body: ListView.builder(
                itemCount: myAlarmList.alarms.length,
                itemBuilder: (context, index) {
                 return AlarmTile(
                      alarm: myAlarmList.alarms[index]
                  );
                }),
            floatingActionButton: FloatingActionButton(
              heroTag: "1",
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              onPressed: () {
                context.pushRoute(const AddAlarmRoute());
              },
              child: const Icon(
                Icons.add_alarm,
                size: 40.0,
              ),
            ),
          );
        }
    );
  }

  Future<void> _pushAddAlarmScreen(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddAlarmScreen()),
    );
  }
}
