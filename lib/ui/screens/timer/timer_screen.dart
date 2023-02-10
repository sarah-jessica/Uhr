import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uhr/provider/timer/mytimer_provider.dart';
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
    return Consumer<MyTimer>(
      builder: (context, myTimer, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: myTimer.isRunning || myTimer.isPaused ?
          const RunningTimer() :
          const SetTimer(),
        );
      },
    );
  }
}
