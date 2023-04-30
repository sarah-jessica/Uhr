import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uhr/app_router.gr.dart';
import 'package:uhr/enums/repetition_type.dart';
import 'package:uhr/services/firestore_services.dart';
import 'package:uhr/ui/widgets/alarm_tile.dart';
import 'package:uhr/ui/widgets/clock_appbar.dart';

class AlarmClockScreen extends ConsumerStatefulWidget {
  const AlarmClockScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AlarmClockScreen> createState() => _AlarmClockScreenState();
}

class _AlarmClockScreenState extends ConsumerState<AlarmClockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ClockAppBar(title: 'alarm-clock'.tr()),
      backgroundColor: Theme.of(context).backgroundColor,
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('alarmclocks').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading... ');
          return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) {
              final String id = snapshot.data!.docs[index].id;
              final QueryDocumentSnapshot<Object?>? alarm = snapshot.data?.docs[index];
              FirestoreServices().updateAlarms(
                  id: int.parse(id),
                  time: DateTime.fromMillisecondsSinceEpoch(alarm!['time'].seconds * 1000),
                  rep: RepetitionTypeExtension.stringToRepetition(alarm['type']),
              );
              return AlarmTile(
                id: int.parse(id),
                name: alarm['name'],
                repetition: RepetitionTypeExtension.stringToRepetition(alarm['type']),
                time: DateTime.fromMillisecondsSinceEpoch(alarm['time'].seconds * 1000),
                isOn: alarm['isOn'],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: '1',
        foregroundColor: Theme.of(context).textTheme.headline1?.color,
        backgroundColor: Theme.of(context).backgroundColor,
        onPressed: () async {
          await context.pushRoute(const AddAlarmPage());
        },
        child: Semantics(
          label: tr('add-alarm-clock'),
          child: const Icon(
            Icons.add_alarm,
            size: 40,
          ),
        ),
      ),
    );
  }
}
