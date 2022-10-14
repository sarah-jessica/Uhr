import 'package:flutter/material.dart';
import 'package:uhr/screens/alarm clock/data.dart';
import 'package:uhr/screens/alarm clock/textInputDecoration.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

// Screen um bereits bestehenden Alarm zu ändern

class ChangeAlarm extends StatefulWidget {
  const ChangeAlarm({Key? key}) : super(key: key);

  @override
  State<ChangeAlarm> createState() => _ChangeAlarmState();
}

class _ChangeAlarmState extends State<ChangeAlarm> {

  DateTime time = DateTime.now();
  String name = 'Alarm';
  bool rep = false;

  List<String> reps = ['Once', 'Daily'];

  Map data = {};



  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)!.settings.arguments as Map;
    int index = data['index'];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Change Alarm Clock'),
        elevation: 0.0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacementNamed(context, '/alarm_clock'),
        ),
        actions: [IconButton(
          icon: Icon(Icons.delete_outline),
          onPressed: () {
            alarms.removeRange(index, index+  1);
            Navigator.pushReplacementNamed(context, '/alarm_clock');
          },
        ),],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 20.0),
              TimePickerSpinner(
                  time: alarms[index].time,
                  is24HourMode: true,
                  isForce2Digits: true,
                  normalTextStyle: TextStyle(
                      fontSize: 30,
                      color: Colors.black12
                  ),
                  highlightedTextStyle: TextStyle(
                      fontSize: 30,
                      color: Colors.black
                  ),
                  spacing: 40,
                  itemHeight: 80,
                  onTimeChange: (time) => setState(() => this.time = time)
              ),
              SizedBox(height: 40.0),
              TextFormField(
                initialValue: alarms[index].name,
                decoration: textInputDecoration.copyWith(label: Text('Alarm Name', style: TextStyle(fontSize: 25.0))),
                onChanged: (val) {
                  setState(() => name = val);
                },
              ),
              SizedBox(height: 40.0),
              DropdownButtonFormField(
                decoration: textInputDecoration.copyWith(label: Text('Repetition', style: TextStyle(fontSize: 25.0))),
                value: alarms[index].rep ? 'Daily' : 'Once',
                items: reps.map((r) {
                  return DropdownMenuItem(
                    value: r,
                    child: Text(r),
                  );
                }).toList(),
                onChanged: (val) => setState(() => val == 'Daily' ? rep = true : rep = false),
              ),
              SizedBox(height: 40.0),
              ElevatedButton(
                child: Text('Save'),
                onPressed: () {
                  alarms[index].changeAlarmData(time, name, true, rep);
                  Navigator.pushReplacementNamed(context, '/alarm_clock');
                  },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
