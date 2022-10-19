import 'package:flutter/material.dart';
import 'package:uhr/clock_appbar.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'data.dart';

// Screen mit dem der Timer eingestellt werden kann

class Timer extends StatefulWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {

  DateTime time = DateTime.now();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ClockAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 80.0),
          TimePickerSpinner(
            time: DateTime(0, 0, 0, 0, 5, 0),
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
              setState(() {
                time = DateTime.now().add(Duration(hours: time.hour, minutes:time.minute, seconds: time.second));
              });
              setTime = time;
              Navigator.pushReplacementNamed(context, '/running_timer');
            },
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            child: const Icon(Icons.play_arrow_outlined, size: 40.0,),
          )
        ],
      ),
    );
  }
}
