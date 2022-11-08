import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:uhr/provider/timer/data_provider.dart';

// Widget mit dem der TimerScreen eingestellt werden kann

class SetTimer extends StatefulWidget {
  final VoidCallback startedTimer;

  const SetTimer({
    Key? key,
    required this.startedTimer,
  }) : super(key: key);

  @override
  State<SetTimer> createState() => _SetTimerState();
}

class _SetTimerState extends State<SetTimer> {

  DateTime time = DateTime(0, 0, 0, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    setTime = DateTime(0, 0, 0, 0, 0, 0);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //const SizedBox(height: 80.0),
          TimePickerSpinner(
            time: time,
            isShowSeconds: true,
            is24HourMode: true,
            isForce2Digits: true,
            normalTextStyle: const TextStyle(
                fontSize: 30,
                color: Colors.black12
            ),
            highlightedTextStyle: const TextStyle(
                fontSize: 30,
                color: Colors.black
            ),
            spacing: 40,
            itemHeight: 80,
            onTimeChange: (time) {
              setState(() => this.time = time);
            },
          ),
          FloatingActionButton(
            heroTag: 'start',
            onPressed: () {
              setState(() {
                setTime = time;
                resetStopWatchTimer();
                stopWatchTimer.setPresetHoursTime(setTime.hour);
                stopWatchTimer.setPresetMinuteTime(setTime.minute);
                stopWatchTimer.setPresetSecondTime(setTime.second);
                stopWatchTimer.onStartTimer();
                widget.startedTimer();
              });
            },
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            child: const Icon(Icons.play_arrow_outlined, size: 40.0,),
          )
        ],
    );
  }

}
