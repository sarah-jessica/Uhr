import 'package:flutter/material.dart';
import 'package:uhr/clock_appbar.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:uhr/timer/data.dart';
import 'package:uhr/notification_service.dart';

// running timer screen

class RunningTimer extends StatefulWidget {
  const RunningTimer({Key? key}) : super(key: key);

  @override
  State<RunningTimer> createState() => _RunningTimerState();
}

class _RunningTimerState extends State<RunningTimer> {

  final _isHours = true;
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      onEnded: () => NotificationService().timerNotification(999, 'Timer expired', ''),
  );

  @override
  Widget build(BuildContext context) {

    _stopWatchTimer.setPresetHoursTime(setTime.hour);
    _stopWatchTimer.setPresetMinuteTime(setTime.minute);
    _stopWatchTimer.setPresetSecondTime(setTime.second);
    _stopWatchTimer.onStartTimer();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ClockAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StreamBuilder<int>(
            stream: _stopWatchTimer.rawTime,
            initialData: _stopWatchTimer.rawTime.value,
            builder: (context, snap) {
              final value = snap.data!;
              final displayTime =
              StopWatchTimer.getDisplayTime(value, hours: _isHours);
              return Text(
                displayTime,
                style: const TextStyle(
                    fontSize: 40,
                    fontFamily: 'Helvetica',
                    fontWeight: FontWeight.bold
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {_stopWatchTimer.onStartTimer();},
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                child: const Icon(Icons.play_arrow_outlined, size: 40.0,),
              ),
              FloatingActionButton(
                onPressed: () {_stopWatchTimer.onStopTimer();},
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                child: const Icon(Icons.pause, size: 30.0,),
              ),
              FloatingActionButton(
                onPressed: () {
                  _stopWatchTimer.onStopTimer();
                  Navigator.pushReplacementNamed(context, '/timer');
                  },
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                child: const Icon(Icons.stop_outlined, size: 40.0,),
              ),
            ],
          )
        ],
      ),
    );
  }
}