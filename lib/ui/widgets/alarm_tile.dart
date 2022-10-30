import 'package:flutter/material.dart';

// generates tiles to display all alarms in alarm_clock_screen.dart

class AlarmTile extends StatefulWidget {
  final int index;
  final DateTime time;
  final String name;
  final bool isOn;
  final bool rep;
  final VoidCallback onUpdate;
  final Function(bool) onAlarmStatusChanged;

  const AlarmTile({
    Key? key,
    required this.index,
    required this.time,
    required this.name,
    required this.isOn,
    required this.rep,
    required this.onUpdate,
    required this.onAlarmStatusChanged,
  }) : super(key: key);

  @override
  State<AlarmTile> createState() => _AlarmTileState();
}

class _AlarmTileState extends State<AlarmTile> {
  @override
  Widget build(BuildContext context) {
    final hour = widget.time.hour < 10 ? '0${widget.time.hour}' : widget.time.hour.toString();
    final minute =
        widget.time.minute < 10 ? '0${widget.time.minute}' : widget.time.minute.toString();

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: const EdgeInsets.fromLTRB(
          20.0,
          6.0,
          20.0,
          0.0,
        ),
        child: ListTile(
          leading: Text(
            '$hour : $minute',
            style: const TextStyle(fontSize: 25.0),
          ),
          title: Text(
            widget.name,
            style: const TextStyle(fontSize: 20.0),
          ),
          subtitle: Text(
            widget.rep ? 'Daily' : 'Once',
            style: const TextStyle(fontSize: 20.0),
          ),
          trailing: Switch(
            value: widget.isOn,
            onChanged: (val) {
              widget.onAlarmStatusChanged(val);
            },
            activeColor: Colors.black,
          ),
          onTap: () async {
            await _pushChangeAlarmScreen(context);
          },
        ),
      ),
    );
  }

  Future<void> _pushChangeAlarmScreen(BuildContext context) async {
    await Navigator.pushNamed(
      context,
      '/change_alarm',
      arguments: {
        'index': widget.index,
      },
    );
    widget.onUpdate();
  }
}
