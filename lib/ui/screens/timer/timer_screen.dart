import 'package:flutter/material.dart';
import 'package:uhr/ui/widgets/clock_appbar.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:uhr/provider/timer/data_provider.dart';

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
      appBar: const ClockAppBar(),
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
              //setState(() {
              //  time = time.add(Duration(hours: time.hour, minutes:time.minute, seconds: time.second));
              //});
              setTime = time;
              Navigator.pushReplacementNamed(context, '/running_TimerScreen');
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
