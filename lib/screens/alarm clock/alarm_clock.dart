import 'package:flutter/material.dart';
import 'package:uhr/screens/clock_appbar.dart';
import 'package:uhr/screens/alarm clock/alarm_tile.dart';
import 'package:uhr/screens/alarm clock/data.dart';

//home screen for the alarm clock

class AlarmClock extends StatefulWidget {
  const AlarmClock({Key? key}) : super(key: key);

  @override
  State<AlarmClock> createState() => _AlarmClockState();
}

class _AlarmClockState extends State<AlarmClock> {

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
      backgroundColor: Colors.white,
      appBar: ClockAppBar(),
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
        child: Icon(Icons.add_alarm, size: 40.0,),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        onPressed: ()  => Navigator.pushReplacementNamed(context, '/add_alarm'),
      ) ,
    );
  }
}
