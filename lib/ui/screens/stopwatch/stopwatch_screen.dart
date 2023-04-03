import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:uhr/ui/widgets/clock_appbar.dart';

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
      appBar: ClockAppBar(title: 'stopwatch-title'.tr()),
      backgroundColor: Theme.of(context).backgroundColor,
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
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Helvetica',
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.headline1?.color,
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  _stopWatchTimerScreen.onStartTimer();
                },
                backgroundColor: Theme.of(context).backgroundColor,
                foregroundColor: Theme.of(context).textTheme.headline1?.color,
                child: const Icon(
                  Icons.play_arrow_outlined,
                  size: 40,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  _stopWatchTimerScreen.onStopTimer();
                },
                backgroundColor: Theme.of(context).backgroundColor,
                foregroundColor: Theme.of(context).textTheme.headline1?.color,
                child: const Icon(
                  Icons.pause,
                  size: 30,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  _stopWatchTimerScreen.onResetTimer();
                },
                backgroundColor: Theme.of(context).backgroundColor,
                foregroundColor: Theme.of(context).textTheme.headline1?.color,
                child: const Icon(
                  Icons.stop_outlined,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
