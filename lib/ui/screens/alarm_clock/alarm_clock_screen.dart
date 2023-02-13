import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uhr/app_router.gr.dart';
import 'package:uhr/bloc/alarm/alarmlist_bloc.dart';
import 'package:uhr/ui/widgets/alarm_tile.dart';

class AlarmClockScreen extends StatefulWidget {
  const AlarmClockScreen({Key? key}) : super(key: key);

  @override
  State<AlarmClockScreen> createState() => _AlarmClockScreenState();
}

class _AlarmClockScreenState extends State<AlarmClockScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlarmListBloc, AlarmListStates>(
      builder: (context,state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: ListView.builder(
              itemCount: state.alarmList.alarms.length,
              itemBuilder: (context, index) {
               return AlarmTile(
                    alarm: state.alarmList.alarms[index],
                );
              },
          ),
          floatingActionButton: FloatingActionButton(
            heroTag: '1',
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            onPressed: () {
              context.pushRoute(const AddAlarmPage());
            },
            child: const Icon(
              Icons.add_alarm,
              size: 40,
            ),
          ),
        );
      },
    );
  }
}
