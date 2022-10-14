import 'package:flutter/material.dart';
import 'package:uhr/screens/clock_appbar.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({Key? key}) : super(key: key);

  @override
  State<Stopwatch> createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ClockAppBar(),
      body: Text('stopwatch'),
    );
  }
}
