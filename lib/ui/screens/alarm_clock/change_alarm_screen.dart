import 'package:flutter/material.dart';
import 'package:uhr/enums/repetition_type.dart';
import 'package:uhr/models/alarm_model.dart';
import 'package:uhr/provider/alarm_clock/myalarmlist_provider.dart';
import 'package:uhr/ui/widgets/text_input_decoration.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:provider/provider.dart';

class ChangeAlarmScreen extends StatefulWidget {
  const ChangeAlarmScreen({Key? key}) : super(key: key);

  @override
  State<ChangeAlarmScreen> createState() => _ChangeAlarmScreenState();
}

class _ChangeAlarmScreenState extends State<ChangeAlarmScreen> {
  late DateTime time;
  late String name;
  late RepetitionType rep;

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    AlarmModel alarm = data['alarm'];
    time = alarm.time;
    name = alarm.name;
    rep = alarm.repetition;

    return Consumer<MyAlarmList>(
      builder: (context, myAlarmList, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Change Alarm Clock'),
            elevation: 0.0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () {
                  myAlarmList.deleteAlarm(alarm.id);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 50.0,
            ),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20.0),
                    TimePickerSpinner(
                      time: alarm.time,
                      is24HourMode: true,
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
                      onTimeChange: (time) =>  this.time = time,
                    ),
                    const SizedBox(height: 40.0),
                    TextFormField(
                      initialValue: alarm.name,
                      decoration: textInputDecoration.copyWith(
                        label: const Text(
                          'Alarm Name',
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                      onChanged: (val) => name = val,
                    ),
                    const SizedBox(height: 40.0),
                    DropdownButtonFormField<RepetitionType>(
                      decoration: textInputDecoration.copyWith(
                        label: const Text(
                          'Repetition',
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                      value: alarm.repetition,
                      items: RepetitionType.values.map((r) {
                        return DropdownMenuItem(
                          value: r,
                          child: Text(r.asString()),
                        );
                      }).toList(),
                      onChanged: (val) => rep = val!,
                    ),
                    const SizedBox(height: 40.0),
                    ElevatedButton(
                      onPressed: () {
                        myAlarmList.changeAlarmData(
                          alarm.id,
                          time,
                          name,
                          rep,
                        );
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 30.0,
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
    );
  }
}
