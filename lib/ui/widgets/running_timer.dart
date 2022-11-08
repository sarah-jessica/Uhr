import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:uhr/provider/timer/data_provider.dart';

// running Timer widget

class RunningTimer extends StatefulWidget {

  final VoidCallback onStopped;

  const RunningTimer({
    Key? key,
    required this.onStopped,
  }) : super(key: key);

  @override
  State<RunningTimer> createState() => _RunningTimerState();
}

class _RunningTimerState extends State<RunningTimer> {

  final _isHours = true;

  @override
  Widget build(BuildContext context) {

    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StreamBuilder<int>(
            stream: stopWatchTimer.rawTime,
            initialData: stopWatchTimer.rawTime.value,
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
                heroTag: 'start',
                onPressed: () {
                  stopWatchTimer.onStartTimer();
                  isPaused = false;
                  },
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                child: const Icon(Icons.play_arrow_outlined, size: 40.0,),
              ),
              FloatingActionButton(
                heroTag: 'pause',
                onPressed: () {
                  stopWatchTimer.onStopTimer();
                  isPaused = true;
                  },
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                child: const Icon(Icons.pause, size: 30.0,),
              ),
              FloatingActionButton(
                heroTag: 'stop',
                onPressed: () {
                  stopWatchTimer.onStopTimer();
                  isPaused = false;
                  widget.onStopped();
                },
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                child: const Icon(Icons.stop_outlined, size: 40.0,),
              ),
            ],
          )
        ],
    );
  }
}