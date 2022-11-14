import 'package:flutter/material.dart';
import 'package:uhr/provider/alarm_clock/myalarmlist_provider.dart';
import 'package:uhr/ui/widgets/text_input_decoration.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:provider/provider.dart';

// Screen um bereits bestehenden Alarm zu ändern

class ChangeAlarmScreen extends StatefulWidget {
  const ChangeAlarmScreen({Key? key}) : super(key: key);

  @override
  State<ChangeAlarmScreen> createState() => _ChangeAlarmScreenState();
}

class _ChangeAlarmScreenState extends State<ChangeAlarmScreen> {
  DateTime time = DateTime.now();
  String name = 'Alarm';
  bool rep = false;

  List<String> reps = ['Once', 'Daily'];

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    int index = data['index'];

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
                  myAlarmList.deleteAlarm(index);
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
                      time: myAlarmList.alarms[index].time,
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
                      onTimeChange: (time) => setState(() => this.time = time),
                    ),
                    const SizedBox(height: 40.0),
                    TextFormField(
                      initialValue: myAlarmList.alarms[index].name,
                      decoration: textInputDecoration.copyWith(
                        label: const Text(
                          'Alarm Name',
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                      onChanged: (val) => name = val,
                    ),
                    const SizedBox(height: 40.0),
                    DropdownButtonFormField(
                      decoration: textInputDecoration.copyWith(
                        label: const Text(
                          'Repetition',
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                      value: myAlarmList.alarms[index].rep ? 'Daily' : 'Once',
                      items: reps.map((r) {
                        return DropdownMenuItem(
                          value: r,
                          child: Text(r),
                        );
                      }).toList(),
                      onChanged: (val) =>
                        val == 'Daily' ? rep = true : rep = false,
                    ),
                    const SizedBox(height: 40.0),
                    ElevatedButton(
                      onPressed: () {
                        myAlarmList.changeAlarmData(
                          index,
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
