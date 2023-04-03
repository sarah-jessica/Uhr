import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:uhr/enums/repetition_type.dart';
import 'package:uhr/main.dart';

class AddAlarmScreen extends ConsumerStatefulWidget {
  const AddAlarmScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AddAlarmScreen> createState() => _AddAlarmScreenState();
}

class _AddAlarmScreenState extends ConsumerState<AddAlarmScreen> {
  DateTime time = DateTime.now();
  String name = 'default-alarm-name'.tr();
  RepetitionType rep = RepetitionType.once;
  List<String> reps = ['once'.tr(), 'daily'.tr()];

  @override
  Widget build(BuildContext context) {
    final alarmList = ref.watch(alarmListChangeNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'add-alarm-clock-title'.tr(),
          style: TextStyle(color: Theme.of(context).textTheme.headline1?.color),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Theme.of(context).textTheme.headline1?.color,
          onPressed: () {
            context.popRoute();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            color: Theme.of(context).textTheme.headline1?.color,
            onPressed: () {
              if (time.isBefore(DateTime.now())) {
                //set day for alarm to the next day
                time = time.add(const Duration(days: 1));
              }
              alarmList.addAlarm(time: time, name: name, repetition: rep);
              context.popRoute();
            },
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
                  onTimeChange: (time) {
                    this.time = time.subtract(
                      Duration(
                        seconds: time.second,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40),
                TextFormField(
                  initialValue: name,
                  style: TextStyle(
                      color: Theme.of(context).textTheme.headline1?.color,),
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
                      'alarm-name-title'.tr(),
                      style: TextStyle(
                        fontSize: 25,
                        color: Theme.of(context).textTheme.headline2?.color,
                      ),
                    ),
                  ),
                  onChanged: (val) {
                    name = val;
                  },
                ),
                const SizedBox(height: 40),
                DropdownButtonFormField<String>(
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
                      'repetition-title'.tr(),
                      style: TextStyle(
                        fontSize: 25,
                        color: Theme.of(context).textTheme.headline2?.color,
                      ),
                    ),
                  ),
                  value: reps[0],
                  items: reps.map((r) {
                    return DropdownMenuItem(
                      value: r,
                      child: Text(
                        r,
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.headline1?.color,),
                      ),
                    );
                  }).toList(),
                  onChanged: (val) {
                    rep = RepetitionTypeExtension.stringToRepetition(val!);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
