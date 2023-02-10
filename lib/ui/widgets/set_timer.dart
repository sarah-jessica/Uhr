import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:provider/provider.dart';
import 'package:uhr/provider/timer/mytimer_provider.dart';

// Widget mit dem der TimerScreen eingestellt werden kann

class SetTimer extends StatefulWidget {
  const SetTimer({Key? key}) : super(key: key);

  @override
  State<SetTimer> createState() => _SetTimerState();
}

class _SetTimerState extends State<SetTimer> {
  DateTime time = DateTime(0, 0, 0, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Consumer<MyTimer>(
      builder: (_, myTimer, __) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TimePickerSpinner(
              time: time,
              isShowSeconds: true,
              isForce2Digits: true,
              normalTextStyle: const TextStyle(fontSize: 30, color: Colors.black12),
              highlightedTextStyle: const TextStyle(fontSize: 30, color: Colors.black),
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
                myTimer..setTime = time
                ..start();
              },
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              child: const Icon(
                Icons.play_arrow_outlined,
                size: 40,
              ),
            )
          ],
        );
      },
    );
  }
}
