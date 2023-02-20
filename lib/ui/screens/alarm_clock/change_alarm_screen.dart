import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:uhr/bloc/alarm/alarmlist_bloc.dart';
import 'package:uhr/enums/repetition_type.dart';
import 'package:uhr/models/alarm_model.dart';
import 'package:uhr/ui/widgets/text_input_decoration.dart';


class ChangeAlarmScreen extends StatelessWidget {
  final AlarmModel alarm;

  const ChangeAlarmScreen({
    Key? key,
    required this.alarm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    DateTime newTime = alarm.time;
    String newName = alarm.name;
    RepetitionType newRepetition = alarm.repetition;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Change Alarm Clock'),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              BlocProvider.of<AlarmListBloc>(context).add(DeleteAlarm(id: alarm.id));
              context.popRoute();
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 50,
        ),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                TimePickerSpinner(
                  time: alarm.time,
                  isForce2Digits: true,
                  normalTextStyle: const TextStyle(
                    fontSize: 30,
                    color: Colors.black12,
                  ),
                  highlightedTextStyle: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                  spacing: 40,
                  itemHeight: 80,
                  onTimeChange: (time) => newTime = time,
                ),
                const SizedBox(height: 40),
                TextFormField(
                  initialValue: alarm.name,
                  onChanged: (val) => newName = val,
                  decoration: textInputDecoration.copyWith(
                    label: const Text(
                      'Alarm Name',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                DropdownButtonFormField<RepetitionType>(
                  decoration: textInputDecoration.copyWith(
                    label: const Text(
                      'Repetition',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  value: alarm.repetition,
                  items: RepetitionType.values.map((r) {
                    return DropdownMenuItem(
                      value: r,
                      child: Text(
                        r.asString(),
                      ),
                    );
                  }).toList(),
                  onChanged: (val) => newRepetition = val!,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AlarmListBloc>(context).add(
                        ChangeAlarmData(
                          id: alarm.id,
                          name: newName,
                          time: newTime,
                          repetition: newRepetition,
                        ),
                    );
                    context.popRoute();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 30,
                    ),
                  ),
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}