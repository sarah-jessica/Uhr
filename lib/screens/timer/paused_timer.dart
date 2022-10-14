import 'package:flutter/material.dart';
import 'package:uhr/screens/clock_appbar.dart';
import 'data.dart';

class pausedTimer extends StatefulWidget {
  const pausedTimer({Key? key}) : super(key: key);

  @override
  State<pausedTimer> createState() => _pausedTimerState();
}

class _pausedTimerState extends State<pausedTimer> {

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
        minutes = (timeLeft.inSeconds / 60.0).toInt();
        seconds = (((timeLeft.inSeconds / 60.0) - minutes) * 60).toInt();
        if (minutes / 60.0 > 1) {
          hours = (minutes / 60.0).toInt();
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
      String hour = this.restTime.hour < 10 ? '0' + this.restTime.hour.toString() : this.restTime.hour.toString();
      String minute = this.restTime.minute < 10 ? '0' + this.restTime.minute.toString() : this.restTime.minute.toString();
      String second = this.restTime.second < 10 ? '0' + this.restTime.second.toString() : this.restTime.second.toString();

      return '$hour : $minute : $second';
    }


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ClockAppBar(),
      body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(restTimeToString(),
                style: TextStyle(
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
                    child: Icon(Icons.play_arrow_outlined, size: 40.0,),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  //SizedBox(width: 100.0,),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/timer');
                    },
                    child: Icon(Icons.stop_outlined, size: 40.0,),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                ],
              )
            ],
          ),
      ),
    );
  }

}