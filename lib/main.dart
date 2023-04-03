import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uhr/app_router.gr.dart';
import 'package:uhr/provider/alarm_clock/myalarmlist_provider.dart';
import 'package:uhr/provider/settings/language_provider.dart';
import 'package:uhr/provider/settings/theme_provider.dart';
import 'package:uhr/provider/timer/mytimer_provider.dart';
import 'package:uhr/services/notification_service.dart';

/*
 - Warning beim Starten der App: 'Operand of null-aware operation '!' has type 'WidgetsBinding' which excludes null.'
 - ob der Alarm bei der Einstellung 'daily' jeden Tag ausgelöst wird, ist nicht getestet
*/

final timerChangeNotifierProvider = ChangeNotifierProvider<MyTimer>((ref) {
  return MyTimer();
});

final alarmListChangeNotifierProvider =
    ChangeNotifierProvider<MyAlarmList>((ref) {
  return MyAlarmList();
});

final languageChangeNotifierProvider =
ChangeNotifierProvider<LanguageProvider>((ref) {
  return LanguageProvider();
});

final themeChangeNotifierProvider = ChangeNotifierProvider<CustomTheme>((ref) {
  return CustomTheme();
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotification();
  await EasyLocalization.ensureInitialized();

  runApp(
    ProviderScope(
      child: EasyLocalization(
          startLocale: const Locale('en', 'US'),
          supportedLocales: const [Locale('en', 'US'), Locale('de', 'DE'), Locale('es', 'ES')],
          path: 'lib/translations',
          fallbackLocale: const Locale('en', 'US'),
          child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final LanguageProvider language = ref.watch(languageChangeNotifierProvider);
    final CustomTheme theme = ref.watch(themeChangeNotifierProvider);
    language.setContext(context);
    return MaterialApp(
      home: MaterialApp.router(
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
        themeMode: theme.currentTheme,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
