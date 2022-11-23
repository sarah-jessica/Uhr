import 'package:flutter/material.dart';
import 'package:uhr/ui/screens/alarm_clock/add_alarm_screen.dart';
import 'package:uhr/ui/widgets/alarm_tile.dart';
import 'package:uhr/provider/alarm_clock/myalarmlist_provider.dart';
import 'package:provider/provider.dart';

//home screen for the alarm clock

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
                  // TODO(Sarah): Anstelle von 5 Parametern, am besten einfach nur den Alarm selbst übergeben

                  return AlarmTile(
                    index: index,
                    time: myAlarmList.alarms[index].time,
                    name: myAlarmList.alarms[index].name,
                    isOn: myAlarmList.alarms[index].isOn,
                    rep: myAlarmList.alarms[index].rep,
                  );
                }),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              onPressed: () => _pushAddAlarmScreen(context),
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
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddAlarmScreen()),
    );
    if (result == 'Yes') setState(() {});
  }
}
