import 'package:flutter/material.dart';
import 'package:uhr/provider/timer/data_provider.dart';
import 'package:uhr/ui/widgets/running_timer.dart';
import 'package:uhr/ui/widgets/set_timer.dart';

// Screen mit dem der TimerScreen eingestellt werden kann

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {

  DateTime time = DateTime(0, 0, 0, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: stopWatchTimer.isRunning || isPaused ?
        RunningTimer(onStopped: () {setState(() {});}) :
        SetTimer(startedTimer: () {setState((){});}),
    );
  }

}
