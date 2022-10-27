import 'package:flutter/material.dart';
import 'package:uhr/ui/widgets/clock_appbar.dart';
import 'package:uhr/ui/widgets/alarm_tile.dart';
import 'package:uhr/provider/alarm_clock/data.dart';

//home screen for the alarm clock

class AlarmClockScreen extends StatefulWidget {
  const AlarmClockScreen({Key? key}) : super(key: key);

  @override
  State<AlarmClockScreen> createState() => _AlarmClockScreenState();
}

class _AlarmClockScreenState extends State<AlarmClockScreen> {

  @override
  void initState () {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    for (int i = 0; i < alarms.length; i++) {
      if(alarms[i].time.isBefore(DateTime.now()) && alarms[i].rep == false) {
        alarms[i].changeAlarm(false);
      }
    }

    return Scaffold(
      appBar: const ClockAppBar(),
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: alarms.length,
          itemBuilder: (context, index) {
            return AlarmTile(
                index: index,
                time: alarms[index].time,
                name: alarms[index].name,
                isOn: alarms[index].isOn,
                rep: alarms[index].rep);
          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        onPressed: ()  => Navigator.pushReplacementNamed(context, '/add_alarm'),
        child: const Icon(Icons.add_alarm, size: 40.0,),
      ) ,
    );
  }
}
