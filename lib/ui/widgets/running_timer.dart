import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:uhr/main.dart';
import 'package:uhr/provider/timer/mytimer_provider.dart';


class RunningTimer extends ConsumerStatefulWidget {

  const RunningTimer({Key? key,}) : super(key: key);

  @override
  ConsumerState<RunningTimer> createState() => _RunningTimerState();
}

class _RunningTimerState extends ConsumerState<RunningTimer> {

  final _isHours = true;

  @override
  Widget build(BuildContext context) {

    final MyTimer timer = ref.watch(timerChangeNotifierProvider);

    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StreamBuilder<int>(
              stream: timer.rawTime,
              initialData: timer.rawTimeValue,
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
                  heroTag: 'start',
                  onPressed: () {
                    timer.start();
                  },
                  backgroundColor: Theme.of(context).backgroundColor,
                  foregroundColor: Theme.of(context).textTheme.headline1?.color,
                  child: const Icon(Icons.play_arrow_outlined, size: 40,),
                ),
                FloatingActionButton(
                  heroTag: 'pause',
                  onPressed: () {
                    timer.pause();
                  },
                  backgroundColor: Theme.of(context).backgroundColor,
                  foregroundColor: Theme.of(context).textTheme.headline1?.color,
                  child: const Icon(Icons.pause, size: 30,),
                ),
                FloatingActionButton(
                  heroTag: 'stop',
                  onPressed: () {
                    timer.stop();
                  },
                  backgroundColor: Theme.of(context).backgroundColor,
                  foregroundColor: Theme.of(context).textTheme.headline1?.color,
                  child: const Icon(Icons.stop_outlined, size: 40,),
                ),
              ],
            ),
         ],
      ),
    );
  }
}