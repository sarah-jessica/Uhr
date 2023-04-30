import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:uhr/main.dart';

class SetTimer extends ConsumerStatefulWidget {
  const SetTimer({Key? key}) : super(key: key);

  @override
  ConsumerState<SetTimer> createState() => _SetTimerState();
}

class _SetTimerState extends ConsumerState<SetTimer> {
  DateTime time = DateTime(
    0,
    0,
    0,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TimePickerSpinner(
          time: time,
          isShowSeconds: true,
          isForce2Digits: true,
          normalTextStyle: TextStyle(
            fontSize: 30,
            color: Theme.of(context).textTheme.headline2?.color,
          ),
          highlightedTextStyle: TextStyle(
            fontSize: 30,
            color: Theme.of(context).textTheme.headline1?.color,
          ),
          spacing: 40,
          itemHeight: 80,
          onTimeChange: (time) {
            setState(
              () => this.time = time,
            );
          },
        ),
        FloatingActionButton(
          heroTag: 'start',
          onPressed: () {
            ref.watch(timerChangeNotifierProvider).setTime = time;
            ref.watch(timerChangeNotifierProvider).start();
          },
          backgroundColor: Theme.of(context).backgroundColor,
          foregroundColor: Theme.of(context).textTheme.headline1?.color,
          child: Semantics(
            label: tr('start'),
            child: const Icon(
              Icons.play_arrow_outlined,
              size: 40,
            ),
          ),
        ),
      ],
    );
  }
}
