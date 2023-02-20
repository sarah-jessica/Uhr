import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:uhr/bloc/timer/timer_bloc.dart';


class RunningTimer extends StatefulWidget {

  const RunningTimer({Key? key,}) : super(key: key);

  @override
  State<RunningTimer> createState() => _RunningTimerState();
}

class _RunningTimerState extends State<RunningTimer> {

  final _isHours = true;

  @override
  Widget build(BuildContext context) {

    final TimerBloc timerBloc = BlocProvider.of<TimerBloc>(context);

    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StreamBuilder<int>(
            stream: timerBloc.state.timer.rawTime,
            initialData: timerBloc.state.timer.rawTimeValue,
            builder: (context, snap) {
              final value = snap.data!;
              final displayTime =
              StopWatchTimer.getDisplayTime(value, hours: _isHours);
              return Text(
                displayTime,
                style: const TextStyle(
                    fontSize: 40,
                    fontFamily: 'Helvetica',
                    fontWeight: FontWeight.bold,
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
                  timerBloc.state.timer.start();
                  },
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                child: const Icon(Icons.play_arrow_outlined, size: 40,),
              ),
              FloatingActionButton(
                heroTag: 'pause',
                onPressed: () {
                  timerBloc.state.timer.pause();
                },
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                child: const Icon(Icons.pause, size: 30,),
              ),
              FloatingActionButton(
                heroTag: 'stop',
                onPressed: () {
                  BlocProvider.of<TimerBloc>(context).add(StopTimer());
                },
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                child: const Icon(Icons.stop_outlined, size: 40,),
              ),
            ],
          ),
       ],
    );
  }
}