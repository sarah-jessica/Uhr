import 'package:flutter/material.dart';
import 'package:uhr/clock_appbar.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:uhr/notificationService.dart';
import 'data.dart';

// Screen der gezeigt wird wenn der Timer läuft

class RunningTimer extends StatefulWidget {
  const RunningTimer({Key? key}) : super(key: key);

  @override
  State<RunningTimer> createState() => _RunningTimerState();
}

class _RunningTimerState extends State<RunningTimer> {

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ClockAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TimerCountdown(
            enableDescriptions: false,
            timeTextStyle: const TextStyle(
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
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                child: const Icon(Icons.pause, size: 30.0,),
              ),
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