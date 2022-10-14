import 'package:flutter/material.dart';
import 'package:uhr/screens/alarm clock/data.dart';
import 'package:uhr/screens/alarm clock/alarm.dart';
import 'package:uhr/screens/alarm clock/textInputDecoration.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

//screen to set a new alarm


class AddAlarm extends StatefulWidget {
  const AddAlarm({Key? key}) : super(key: key);

  @override
  State<AddAlarm> createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {

  DateTime time = DateTime.now();
  String name = 'Alarm';
  bool rep = false;

  List<String> reps = ['Once', 'Daily'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add Alarm Clock'),
        elevation: 0.0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacementNamed(context, '/alarm_clock'),
        ),
        actions: [IconButton(
          icon: Icon(Icons.check),
          onPressed: () {
            if (time.isBefore(DateTime.now())) {
              //set day for alarm to the next day
              setState(() => time = time.add(Duration(days: 1)));
            }
            alarms.add(Alarm(time, name, true, rep));
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
                onTimeChange: (time) {
                  setState(() => this.time = time.subtract(Duration(seconds: time.second)));
                },
              ),
              SizedBox(height: 40.0),
              TextFormField(
                initialValue: name,
                decoration: textInputDecoration.copyWith(label: Text('Alarm Name', style: TextStyle(fontSize: 25.0))),
                onChanged: (val) {
                  setState(() => name = val);
                },
              ),
              SizedBox(height: 40.0),
              DropdownButtonFormField(
                decoration: textInputDecoration.copyWith(label: Text('Repetition', style: TextStyle(fontSize: 25.0))),
                value: rep ? 'Daily' : 'Once',
                items: reps.map((r) {
                  return DropdownMenuItem(
                    value: r,
                    child: Text(r),
                  );
                }).toList(),
                onChanged: (val) => setState(() => val == 'Daily' ? rep = true : rep = false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
