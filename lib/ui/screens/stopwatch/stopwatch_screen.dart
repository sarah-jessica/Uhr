import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

// stopwatch screen

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({Key? key}) : super(key: key);

  @override
  State<StopwatchScreen> createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {

  final _isHours = true;
  final StopWatchTimer _stopWatchTimerScreen = StopWatchTimer();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
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
                onPressed: () {_stopWatchTimerScreen.onResetTimer();},
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
