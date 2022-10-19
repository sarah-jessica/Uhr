import 'package:flutter/material.dart';
import 'package:uhr/clock_appbar.dart';
import 'data.dart';

// Screen der gezeigt wird wenn der Timer pausiert ist

class PausedTimer extends StatefulWidget {
  const PausedTimer({Key? key}) : super(key: key);

  @override
  State<PausedTimer> createState() => _PausedTimerState();
}

class _PausedTimerState extends State<PausedTimer> {

  late DateTime restTime;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    void restTime () {
      Duration timeLeft = setTime.difference(DateTime.now());
      int minutes = 0;
      int hours = 0;
      int seconds;

      if (timeLeft.inSeconds / 60.0 > 1) {
        minutes = timeLeft.inSeconds ~/ 60.0;
        seconds = (((timeLeft.inSeconds / 60.0) - minutes) * 60).toInt();
        if (minutes / 60.0 > 1) {
          hours = minutes ~/ 60.0;
          minutes = (((minutes / 60.0) - hours) * 60).toInt();
        }
      } else {
        seconds = timeLeft.inSeconds;
      }


      setState(() {
        this.restTime = DateTime(0, 0, 0, hours, minutes, seconds);
      });
    }

    String restTimeToString() {
      restTime();
      String hour = this.restTime.hour < 10 ? '0${this.restTime.hour}' : this.restTime.hour.toString();
      String minute = this.restTime.minute < 10 ? '0${this.restTime.minute}' : this.restTime.minute.toString();
      String second = this.restTime.second < 10 ? '0${this.restTime.second}' : this.restTime.second.toString();

      return '$hour : $minute : $second';
    }


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ClockAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(restTimeToString(),
            style: const TextStyle(
                fontSize: 60,
                color: Colors.black
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  DateTime endTime = DateTime.now().add(Duration(
                    hours: this.restTime.hour,
                    minutes: this.restTime.minute,
                    seconds: this.restTime.second,
                  ));
                  setTime = endTime;
                  Navigator.pushReplacementNamed(context, '/running_timer');
                },
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                child: const Icon(Icons.play_arrow_outlined, size: 40.0,),
              ),
              //SizedBox(width: 100.0,),
              FloatingActionButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/timer');
                },
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                child: const Icon(Icons.stop_outlined, size: 40.0,),
              ),
            ],
          )
        ],
      ),
    );
  }

}