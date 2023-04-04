import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uhr/main.dart';
import 'package:uhr/provider/timer/mytimer_provider.dart';
import 'package:uhr/ui/widgets/running_timer.dart';
import 'package:uhr/ui/widgets/set_timer.dart';

class TimerScreen extends ConsumerStatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends ConsumerState<TimerScreen> {

  @override
  Widget build(BuildContext context) {
    final MyTimer timer = ref.watch(timerChangeNotifierProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: timer.isRunning || timer.isPaused ?
          const RunningTimer() :
          const SetTimer(),
    );
  }
}