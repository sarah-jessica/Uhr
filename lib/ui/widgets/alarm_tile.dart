import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uhr/app_router.gr.dart';
import 'package:uhr/enums/repetition_type.dart';
import 'package:uhr/services/firestore_services.dart';
import 'package:uhr/utils/extensions.dart';

class AlarmTile extends ConsumerStatefulWidget {
  final int id;
  final String name;
  final DateTime time;
  final RepetitionType repetition;
  final bool isOn;

  const AlarmTile({
    Key? key,
    required this.id,
    required this.name,
    required this.time,
    required this.repetition,
    required this.isOn,
  }) : super(key: key);

  @override
  ConsumerState<AlarmTile> createState() => _AlarmTileState();
}

class _AlarmTileState extends ConsumerState<AlarmTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child:
      Card(
        color: Theme.of(context).backgroundColor,
        margin: const EdgeInsets.fromLTRB(
          20,
          6,
          20,
          0,
        ),
        child: ListTile(
          leading: Text(
            widget.time.toFormattedTimeString(),
            style: TextStyle(
              fontSize: 25,
              color: Theme.of(context).textTheme.headline1?.color,
            ),
          ),
          title: ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 25,
            ),
            child: Text(
              widget.name,
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).textTheme.headline1?.color,
              ),
            ),
          ),
          subtitle: Text(
            widget.repetition == RepetitionType.daily
                ? 'daily'.tr()
                : 'once'.tr(),
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).textTheme.headline2?.color,
            ),
          ),
          trailing: Switch(
            value: widget.isOn,
            activeColor: Theme.of(context).textTheme.headline1?.color,
            onChanged: (val) {
              FirestoreServices().changeAlarmState(id: widget.id, isOn: val);
            },
          ),
          onTap: () => context.pushRoute(
            ChangeAlarmPage(
              id: widget.id,
              name: widget.name,
              time: widget.time,
              repetition: widget.repetition,
              isOn: widget.isOn,
            ),
          ),
        ),
      ),
      );
  }
}
