import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uhr/bloc/timer/timer_bloc.dart';
import 'package:uhr/ui/widgets/running_timer.dart';
import 'package:uhr/ui/widgets/set_timer.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<TimerBloc, TimerStates> (
        builder: (context, state) {
          return state.timer.isRunning || state.timer.isPaused ?
          const RunningTimer() :
          const SetTimer();
        },
      ),
    );
  }
}