import 'package:flutter/material.dart';
import 'package:uhr/screens/clock_appbar.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'data.dart';

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
      appBar: ClockAppBar(),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 80.0),
            TimePickerSpinner(
              time: DateTime(0, 0, 0, 0, 5, 0),
              isShowSeconds: true,
              is24HourMode: true,
              isForce2Digits: true,
              normalTextStyle: TextStyle(
                  fontSize: 30,
                  color: Colors.black12
              ),
              highlightedTextStyle: TextStyle(
                  fontSize: 30,
                  color: Colors.black
              ),
              spacing: 40,
              itemHeight: 80,
              onTimeChange: (time) {
                setState(() => this.time = time);
              },
            ),
            SizedBox(height: 80.0,),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  time = DateTime.now().add(Duration(hours: time.hour, minutes:time.minute, seconds: time.second));
                });
                setTime = time;
                Navigator.pushReplacementNamed(context, '/running_timer');
              },
              child: Icon(Icons.play_arrow_outlined, size: 40.0,),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
