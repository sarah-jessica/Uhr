import 'package:flutter/material.dart';
import 'package:uhr/enums/repetition_type.dart';
import 'package:uhr/ui/widgets/text_input_decoration.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:provider/provider.dart';
import 'package:uhr/view_models/change_alarm_view_model.dart';

class ChangeAlarmScreen extends StatelessWidget {
  const ChangeAlarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ChangeAlarmViewModel>(
      builder: (_, viewModel, __) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Change Alarm Clock'),
            elevation: 0.0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () {
                  viewModel.deleteAlarm();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 50.0,
            ),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20.0),
                    TimePickerSpinner(
                      time: viewModel.currentAlarm.time,
                      is24HourMode: true,
                      isForce2Digits: true,
                      normalTextStyle: const TextStyle(
                        fontSize: 30,
                        color: Colors.black12,
                      ),
                      highlightedTextStyle: const TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                      spacing: 40,
                      itemHeight: 80,
                      onTimeChange: viewModel.onDateSelected,
                    ),
                    const SizedBox(height: 40.0),
                    TextFormField(
                      controller: viewModel.alarmNameTextEditingController,
                      decoration: textInputDecoration.copyWith(
                        label: const Text(
                          'Alarm Name',
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    DropdownButtonFormField<RepetitionType>(
                      decoration: textInputDecoration.copyWith(
                        label: const Text(
                          'Repetition',
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                      value: viewModel.currentAlarm.repetition,
                      items: RepetitionType.values.map((r) {
                        return DropdownMenuItem(
                          value: r,
                          child: Text(
                            r.asString(),
                          ),
                        );
                      }).toList(),
                      onChanged: viewModel.onRepetitionSelected,
                    ),
                    const SizedBox(height: 40.0),
                    ElevatedButton(
                      onPressed: () {
                        viewModel.updateAlarm();
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 30.0,
                        ),
                      ),
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
