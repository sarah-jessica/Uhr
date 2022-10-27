import 'package:flutter/material.dart';
import 'package:uhr/ui/widgets/clock_appbar.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:uhr/provider/timer/data_provider.dart';
import 'package:uhr/services/notification_service.dart';

// running TimerScreen screen

class RunningTimerScreenScreen extends StatefulWidget {
  const RunningTimerScreenScreen({Key? key}) : super(key: key);

  @override
  State<RunningTimerScreenScreen> createState() => _RunningTimerScreenScreenState();
}

class _RunningTimerScreenScreenState extends State<RunningTimerScreenScreen> {

  final _isHours = true;
  final StopWatchTimer _stopWatchTimerScreen = StopWatchTimer(
      mode: StopWatchMode.countDown,
      onEnded: () => NotificationService().timerScreenNotification(999, 'TimerScreen expired', ''),
  );

  @override
  Widget build(BuildContext context) {

    _stopWatchTimerScreen.setPresetHoursTime(setTime.hour);
    _stopWatchTimerScreen.setPresetMinuteTime(setTime.minute);
    _stopWatchTimerScreen.setPresetSecondTime(setTime.second);
    _stopWatchTimerScreen.onStartTimer();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ClockAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StreamBuilder<int>(
            stream: _stopWatchTimerScreen.rawTime,
            initialData: _stopWatchTimerScreen.rawTime.value,
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
                onPressed: () {_stopWatchTimerScreen.onStartTimer();},
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                child: const Icon(Icons.play_arrow_outlined, size: 40.0,),
              ),
              FloatingActionButton(
                onPressed: () {_stopWatchTimerScreen.onStopTimer();},
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                child: const Icon(Icons.pause, size: 30.0,),
              ),
              FloatingActionButton(
                onPressed: () {
                  _stopWatchTimerScreen.onStopTimer();
                  Navigator.pushReplacementNamed(context, '/TimerScreen');
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