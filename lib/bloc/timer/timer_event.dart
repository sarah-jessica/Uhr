part of 'timer_bloc.dart';

class TimerEvent {}

class StartTimer extends TimerEvent{
  final DateTime time;
  StartTimer({required this.time});
}

class StopTimer extends TimerEvent{}
