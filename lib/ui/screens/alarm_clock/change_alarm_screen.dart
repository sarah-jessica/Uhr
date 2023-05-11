import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:uhr/enums/repetition_type.dart';
import 'package:uhr/services/firestore_services.dart';

class ChangeAlarmScreen extends ConsumerWidget {
  final int id;
  final String name;
  final DateTime time;
  final RepetitionType repetition;
  final bool isOn;

  const ChangeAlarmScreen({
    Key? key,
    required this.id,
    required this.name,
    required this.time,
    required this.repetition,
    required this.isOn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime newTime = time;
    String newName = name;
    RepetitionType newRepetition = repetition;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'change-alarm-clock'.tr(),
          style: TextStyle(color: Theme.of(context).textTheme.headline1?.color),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Semantics(
            label: tr('back'),
            child: const Icon(Icons.arrow_back),
          ),
          color: Theme.of(context).textTheme.headline1?.color,
          onPressed: () {
            context.popRoute();
          },
        ),
        actions: [
          Semantics(
            label: tr('delete_alarm'),
            child: IconButton(
              icon: const Icon(Icons.delete_outline),
              color: Theme.of(context).textTheme.headline1?.color,
              onPressed: () {
                FirestoreServices().deleteAlarm(id);
                context.popRoute();
              },
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 50,
        ),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                TimePickerSpinner(
                  time: time,
                  isForce2Digits: true,
                  normalTextStyle: TextStyle(
                    fontSize: 30,
                    color: Theme.of(context).textTheme.headline2?.color,
                  ),
                  highlightedTextStyle: TextStyle(
                    fontSize: 30,
                    color: Theme.of(context).textTheme.headline1?.color,
                  ),
                  spacing: 40,
                  itemHeight: 80,
                  onTimeChange: (time) => newTime = time,
                ),
                const SizedBox(height: 40),
                TextFormField(
                  initialValue: name,
                  style: TextStyle(
                      color: Theme.of(context).textTheme.headline1?.color,),
                  onChanged: (val) => newName = val,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context).textTheme.headline2!.color!,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context).textTheme.headline1!.color!,
                      ),
                    ),
                    label: Text(
                      'alarm-name'.tr(),
                      style: TextStyle(
                        fontSize: 25,
                        color: Theme.of(context).textTheme.headline2?.color,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                DropdownButtonFormField<RepetitionType>(
                  dropdownColor: Theme.of(context).backgroundColor,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context).textTheme.headline2!.color!,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context).textTheme.headline1!.color!,
                      ),
                    ),
                    label: Text(
                      'repetition'.tr(),
                      style: TextStyle(
                        fontSize: 25,
                        color: Theme.of(context).textTheme.headline2?.color,
                      ),
                    ),
                  ),
                  value: repetition,
                  items: RepetitionType.values.map((r) {
                    return DropdownMenuItem(
                      value: r,
                      child: Text(
                        r.asString(),
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.headline1?.color,),
                      ),
                    );
                  }).toList(),
                  onChanged: (val) => newRepetition = val!,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    FirestoreServices().changeAlarmData(
                      id: id,
                      time: newTime,
                      name: newName,
                      rep: newRepetition,
                    );
                    context.popRoute();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).backgroundColor,
                    shadowColor: Theme.of(context).textTheme.headline1?.color,
                    elevation: 5,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 30,
                    ),
                  ),
                  child: Text(
                    'save'.tr(),
                    style: TextStyle(
                        color: Theme.of(context).textTheme.headline1?.color,),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
