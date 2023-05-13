import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uhr/app_router.gr.dart';
import 'package:uhr/enums/repetition_type.dart';
import 'package:uhr/models/alarm_model.dart';
import 'package:uhr/services/database_helper.dart';
import 'package:uhr/utils/extensions.dart';

class AlarmTile extends ConsumerStatefulWidget {
  final AlarmModel alarm;

  const AlarmTile({
    Key? key,
    required this.alarm,
  }) : super(key: key);

  @override
  ConsumerState<AlarmTile> createState() => _AlarmTileState();
}

class _AlarmTileState extends ConsumerState<AlarmTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Card(
        color: Theme.of(context).backgroundColor,
        margin: const EdgeInsets.fromLTRB(
          20,
          6,
          20,
          0,
        ),
        child: ListTile(
          leading: Text(
            widget.alarm.time.toFormattedTimeString(),
            style: TextStyle(
              fontSize: 25,
              color: Theme.of(context).textTheme.headline1?.color,
            ),
          ),
          title: Text(
            widget.alarm.name,
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).textTheme.headline1?.color,
            ),
          ),
          subtitle: Text(
            widget.alarm.repetition == RepetitionType.daily
                ? 'daily'.tr()
                : 'once'.tr(),
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).textTheme.headline2?.color,
            ),
          ),
          trailing: Switch(
            value: widget.alarm.isOn,
            activeColor: Theme.of(context).textTheme.headline1?.color,
            onChanged: (val) {
              DatabaseHelper.instance.updateState(
                alarm: widget.alarm,
                isOn: val,
              );
            },
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
