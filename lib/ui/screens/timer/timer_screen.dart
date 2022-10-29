import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:uhr/provider/timer/data_provider.dart';
import 'package:uhr/ui/screens/timer/running_timer_screen.dart';

// Screen mit dem der TimerScreen eingestellt werden kann

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {

  DateTime time = DateTime(0, 0, 0, 0, 0, 0);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 80.0),
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
          const SizedBox(height: 80.0,),
          FloatingActionButton(
            onPressed: () {
              setTime = time;
              _pushRunningTimerScreen(context);
            },
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            child: const Icon(Icons.play_arrow_outlined, size: 40.0,),
          )
        ],
      ),
    );
  }

  Future<void> _pushRunningTimerScreen(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RunningTimerScreen()),
    );
  }
}
