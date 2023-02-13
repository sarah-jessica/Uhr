import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uhr/provider/timer/mytimer_provider.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerStates> {

  TimerBloc() : super(TimerStates(timer: MyTimer())) {
    on<StartTimer>((event, emit) {
      state.timer.setTime = event.time;
      state.timer.start();
      emit(TimerStates(timer: state.timer));
    });
    on<StopTimer>((event, emit) {
      state.timer.stop();
      emit(TimerStates(timer: state.timer));
    });
  }

}