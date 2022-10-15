import 'package:flutter/material.dart';
import 'package:uhr/clock_appbar.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:uhr/notificationService.dart';
import 'data.dart';

// Screen der gezeigt wird wenn der Timer läuft

class runningTimer extends StatefulWidget {
  const runningTimer({Key? key}) : super(key: key);

  @override
  State<runningTimer> createState() => _runningTimerState();
}

class _runningTimerState extends State<runningTimer> {

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ClockAppBar(),
      body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TimerCountdown(
                enableDescriptions: false,
                timeTextStyle: TextStyle(
                    fontSize: 60,
                    color: Colors.black
                ),
                format: CountDownTimerFormat.hoursMinutesSeconds,
                endTime: setTime,
                onEnd: () {
                  NotificationService().timerNotification(999, 'Timer Expired', '');
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacementNamed(context, '/paused_timer');
                      });
                    },
                    child: Icon(Icons.pause, size: 30.0,),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
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