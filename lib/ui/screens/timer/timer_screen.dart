import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uhr/main.dart';
import 'package:uhr/provider/timer/mytimer_provider.dart';
import 'package:uhr/ui/widgets/clock_appbar.dart';
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
      appBar: ClockAppBar(title: 'timer-title'.tr()),
      backgroundColor: Theme.of(context).backgroundColor,
      body: timer.isRunning || timer.isPaused
          ? const RunningTimer()
          : const SetTimer(),
    );
  }
}
