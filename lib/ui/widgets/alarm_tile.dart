import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uhr/provider/alarm_clock/myalarmlist_provider.dart';
import 'package:uhr/utils/extensions.dart';

// Tiles to display all alarms in alarm_clock_screen.dart

class AlarmTile extends StatefulWidget {
  // TODO(Sarah): Anstelle von 5 Parametern, am besten einfach nur den Alarm selbst übergeben
  // final AlarmModel alarm;


  final int index;
  final DateTime time;
  final String name;
  final bool isOn;
  final bool rep;

  const AlarmTile({
    Key? key,
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
    return Consumer<MyAlarmList>(
      builder: (context, myAlarmList, child) {
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
                widget.time.toFormattedTimeString(),
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
                  myAlarmList.changeAlarmStatus(widget.index, val);
                },
                activeColor: Colors.black,
              ),
              onTap: () async {
                await _pushChangeAlarmScreen(context);
              },
            ),
          ),
        );
      },
    );
  }

  Future<void> _pushChangeAlarmScreen(BuildContext context) async {
    await Navigator.pushNamed(
      context,
      '/change_alarm',
      // TODO(Sarah): Auch hier besser den Alarm übergeben
      arguments: {
        'index': widget.index,
      },
    );
  }
}
