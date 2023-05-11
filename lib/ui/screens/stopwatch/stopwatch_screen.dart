import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:uhr/main.dart';
import 'package:uhr/provider/settings/theme_provider.dart';
import 'package:uhr/ui/widgets/clock_appbar.dart';
import 'package:uhr/utils/extensions.dart';

class StopwatchScreen extends ConsumerStatefulWidget {
  const StopwatchScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<StopwatchScreen> createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends ConsumerState<StopwatchScreen> {
  final _isHours = true;
  final StopWatchTimer _stopWatchTimerScreen = StopWatchTimer();

  @override
  Widget build(BuildContext context) {
    final CustomTheme theme = ref.watch(themeChangeNotifierProvider);
    return Scaffold(
      appBar: ClockAppBar(title: 'stopwatch'.tr()),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: theme.currentTheme == ThemeMode.light ?
                const AssetImage('lib/assets/lightMarble.jpg') :
                const AssetImage('lib/assets/darkMarble.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StreamBuilder<int>(
              stream: _stopWatchTimerScreen.rawTime,
              initialData: _stopWatchTimerScreen.rawTime.value,
              builder: (context, snap) {
                final value = snap.data!;
                final displayTime =
                    StopWatchTimer.getDisplayTime(value, hours: _isHours);
                return Semantics(
                  label: StopWatchTimerExtension.timeAsString(value),
                  child: ExcludeSemantics(
                    child: Text(
                      displayTime,
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.headline1?.color,
                      ),
                    ),
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    _stopWatchTimerScreen.onStartTimer();
                  },
                  backgroundColor: Theme.of(context).backgroundColor,
                  foregroundColor: Theme.of(context).textTheme.headline1?.color,
                  child: Semantics(
                    label: tr('start'),
                    child: const Icon(
                      Icons.play_arrow_outlined,
                      size: 40,
                    ),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    _stopWatchTimerScreen.onStopTimer();
                  },
                  backgroundColor: Theme.of(context).backgroundColor,
                  foregroundColor: Theme.of(context).textTheme.headline1?.color,
                  child: Semantics(
                    label: tr('pause'),
                    child: const Icon(
                      Icons.pause,
                      size: 30,
                    ),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    _stopWatchTimerScreen.onResetTimer();
                  },
                  backgroundColor: Theme.of(context).backgroundColor,
                  foregroundColor: Theme.of(context).textTheme.headline1?.color,
                  child: Semantics(
                    label: tr('stop'),
                    child: const Icon(
                      Icons.stop_outlined,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),],
      ),
    );
  }
}