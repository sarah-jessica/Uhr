import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uhr/enums/repetition_type.dart';
import 'package:uhr/provider/alarm_clock/myalarmlist_provider.dart';

part 'alarmlist_event.dart';
part 'alarmlist_state.dart';

class AlarmListBloc extends Bloc<AlarmListEvent, AlarmListStates> {

  AlarmListBloc() : super(AlarmListStates(alarmList: MyAlarmList())) {
    on<AddAlarm>((event, emit) {
      state.alarmList.addAlarm(time: event.time, name: event.name, repetition: event.repetition);
      emit(AlarmListStates(alarmList: state.alarmList));
    });
    on<ChangeAlarm>((event, emit) {
      state.alarmList.changeAlarmState(id: event.id, isOn: event.isOn);
      emit(AlarmListStates(alarmList: state.alarmList));
    });
    on<DeleteAlarm>((event, emit) {
      state.alarmList.deleteAlarm(event.id);
      emit(AlarmListStates(alarmList: state.alarmList));
    });
    on<ChangeAlarmData>((event, emit) {
      state.alarmList.changeAlarmData(
        id: event.id,
        time: event.time,
        name: event.name,
        rep: event.repetition,
      );
      emit(AlarmListStates(alarmList: state.alarmList));
    });
  }

}