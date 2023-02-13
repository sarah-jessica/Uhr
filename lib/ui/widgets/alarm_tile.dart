import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uhr/app_router.gr.dart';
import 'package:uhr/bloc/alarm/alarmlist_bloc.dart';
import 'package:uhr/enums/repetition_type.dart';
import 'package:uhr/models/alarm_model.dart';
import 'package:uhr/utils/extensions.dart';

class AlarmTile extends StatefulWidget {
  final AlarmModel alarm;

  const AlarmTile({
    Key? key,
    required this.alarm,
  }) : super(key: key);

  @override
  State<AlarmTile> createState() => _AlarmTileState();
}

class _AlarmTileState extends State<AlarmTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Card(
        margin: const EdgeInsets.fromLTRB(
          20,
          6,
          20,
          0,
        ),
        child: ListTile(
          leading: Text(
            widget.alarm.time.toFormattedTimeString(),
            style: const TextStyle(fontSize: 25),
          ),
          title: Text(
            widget.alarm.name,
            style: const TextStyle(fontSize: 20),
          ),
          subtitle: Text(
            widget.alarm.repetition == RepetitionType.daily ? 'Daily' : 'Once',
            style: const TextStyle(fontSize: 20),
          ),
          trailing: Switch(
            value: widget.alarm.isOn,
            onChanged: (val) {
              BlocProvider.of<AlarmListBloc>(context).add(ChangeAlarm(id: widget.alarm.id, isOn: val));
            },
            activeColor: Colors.black,
          ),
          onTap: () => context.pushRoute(
            ChangeAlarmPage(
              alarm: widget.alarm,
            ),
          ),
        ),
      ),
    );
  }
}
