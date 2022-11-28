import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uhr/enums/repetition_type.dart';
import 'package:uhr/models/alarm_model.dart';
import 'package:uhr/provider/alarm_clock/myalarmlist_provider.dart';
import 'package:uhr/utils/extensions.dart';

class AlarmTile extends StatefulWidget {

  final AlarmModel alarm;

  const AlarmTile({
    Key? key,
    required this.alarm
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
                widget.alarm.time.toFormattedTimeString(),
                style: const TextStyle(fontSize: 25.0),
              ),
              title: Text(
                widget.alarm.name,
                style: const TextStyle(fontSize: 20.0),
              ),
              subtitle: Text(
                widget.alarm.repetition == RepetitionType.daily ? 'Daily' : 'Once',
                style: const TextStyle(fontSize: 20.0),
              ),
              trailing: Switch(
                value: widget.alarm.isOn!,
                onChanged: (val) {
                  myAlarmList.changeAlarmState(widget.alarm.id, val);
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
      arguments: {
        'alarm': widget.alarm,
      },
    );
  }
}
