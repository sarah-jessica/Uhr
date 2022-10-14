import 'package:flutter/material.dart';
import 'package:uhr/screens/alarm clock/data.dart';

// generates tiles to display all alarms in alarm_clock.dart

class AlarmTile extends StatefulWidget {
  //const AlarmTile({Key? key}) : super(key: key);

  int index;
  DateTime time;
  String name;
  bool isOn;
  bool rep;

  AlarmTile({
    required this.index,
    required this.time,
    required this.name,
    required this.isOn,
    required this.rep });


  @override
  State<AlarmTile> createState() => _AlarmTileState();
}

class _AlarmTileState extends State<AlarmTile> {


  @override
  Widget build(BuildContext context) {

    String hour = widget.time.hour < 10 ? '0' + widget.time.hour.toString() : widget.time.hour.toString();
    String minute = widget.time.minute < 10 ? '0' + widget.time.minute.toString() : widget.time.minute.toString();

    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: Text(hour + ' : ' + minute, style: TextStyle(fontSize: 25.0),),
          title: Text(widget.name, style: TextStyle(fontSize: 20.0),),
          subtitle: Text(widget.rep ? 'Daily' : 'Once', style: TextStyle(fontSize: 20.0), ),
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
          onTap: () {Navigator.pushReplacementNamed(context, '/change_alarm', arguments: {'index' : widget.index});},
        ),
      ),
    );
  }
}
