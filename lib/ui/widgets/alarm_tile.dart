import 'package:flutter/material.dart';
import 'package:uhr/provider/alarm_clock/data.dart';

// generates tiles to display all alarms in alarm_clock_screen.dart

class AlarmTile extends StatefulWidget {

  int index;
  DateTime time;
  String name;
  bool isOn;
  bool rep;
  bool isDeleted = false;

  AlarmTile({Key? key,
    required this.index,
    required this.time,
    required this.name,
    required this.isOn,
    required this.rep,
  }) : super(key: key);


  @override
  State<AlarmTile> createState() => _AlarmTileState();
}

class _AlarmTileState extends State<AlarmTile> {

  @override
  Widget build(BuildContext context) {

    if (widget.isDeleted) return const SizedBox(); // gibt es eine bessere Lösung??

    String hour = widget.time.hour < 10 ? '0${widget.time.hour}' : widget.time
        .hour.toString();
    String minute = widget.time.minute < 10 ? '0${widget.time.minute}' : widget
        .time.minute.toString();

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: Text(
            '$hour : $minute', style: const TextStyle(fontSize: 25.0),),
          title: Text(widget.name, style: const TextStyle(fontSize: 20.0),),
          subtitle: Text(widget.rep ? 'Daily' : 'Once',
            style: const TextStyle(fontSize: 20.0),),
          trailing: Switch(
            value: widget.isOn,
            onChanged: (val) {
              setState(() {
                widget.isOn = val;
                alarms[widget.index].changeAlarm(val);
              });
            },
            activeColor: Colors.black,
          ),
          onTap: () {
            _pushChangeAlarmScreen(context);
          },
        ),
      ),
    );
  }

  Future<void> _pushChangeAlarmScreen(BuildContext context) async {
    final result = await Navigator.pushNamed(
        context,
        '/change_alarm',
        arguments: {'index': widget.index}
    );
    if (result == 'Yes') {
      setState(() {
        widget.name = alarms[widget.index].name;
        widget.isOn = alarms[widget.index].isOn;
        widget.time = alarms[widget.index].time;
        widget.time = alarms[widget.index].time;
      });
    }
    if (result == 'Deleted') {
      setState(() {
        widget.isDeleted = true;
      });
    }
  }
}