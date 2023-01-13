import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uhr/enums/repetition_type.dart';
import 'package:uhr/provider/alarm_clock/myalarmlist_provider.dart';
import 'package:uhr/ui/widgets/text_input_decoration.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:provider/provider.dart';

class AddAlarmScreen extends StatefulWidget {
  const AddAlarmScreen({Key? key}) : super(key: key);

  @override
  State<AddAlarmScreen> createState() => _AddAlarmScreenState();
}

class _AddAlarmScreenState extends State<AddAlarmScreen> {

  DateTime time = DateTime.now();
  String name = 'Alarm';
  RepetitionType rep = RepetitionType.once;
  List<String> reps = ['Once', 'Daily'];

  @override
  Widget build(BuildContext context) {
    return Consumer<MyAlarmList>(
      builder: (context, myAlarmList, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Add Alarm Clock'),
            elevation: 0.0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.popRoute();
              },
            ),
            actions: [IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                if (time.isBefore(DateTime.now())) {
                  //set day for alarm to the next day
                  time = time.add(const Duration(days: 1));
                }
                myAlarmList.addAlarm(
                    time: time,
                    name: name,
                    repetition: rep
                );
                context.popRoute();
              },
            ),
            ],
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(
                vertical: 20.0, horizontal: 50.0
            ),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20.0),
                    TimePickerSpinner(
                      is24HourMode: true,
                      isForce2Digits: true,
                      normalTextStyle: const TextStyle(
                          fontSize: 30,
                          color: Colors.black12
                      ),
                      highlightedTextStyle: const TextStyle(
                          fontSize: 30,
                          color: Colors.black
                      ),
                      spacing: 40,
                      itemHeight: 80,
                      onTimeChange: (time) {
                        this.time = time.subtract(Duration(
                          seconds: time.second));
                      },
                    ),
                    const SizedBox(height: 40.0),
                    TextFormField(
                      initialValue: name,
                      decoration: textInputDecoration.copyWith(
                          label: const Text(
                              'Alarm Name', style: TextStyle(fontSize: 25.0))),
                      onChanged: (val) {
                        name = val;
                      },
                    ),
                    const SizedBox(height: 40.0),
                    DropdownButtonFormField<RepetitionType>(
                      decoration: textInputDecoration.copyWith(
                          label: const Text(
                              'Repetition', style: TextStyle(fontSize: 25.0))),
                      value: rep,
                      items: RepetitionType.values.map((r) {
                        return DropdownMenuItem(
                          value: r,
                          child: Text(r.asString()),
                        );
                      }).toList(),
                      onChanged: (val) => rep = val!,
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
