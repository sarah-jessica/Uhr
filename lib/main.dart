import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uhr/app_router.gr.dart';
import 'package:uhr/provider/settings/theme_provider.dart';
import 'package:uhr/provider/timer/mytimer_provider.dart';
import 'package:uhr/services.dart';
import 'package:uhr/services/database_helper.dart';
import 'package:uhr/services/notification_service.dart';
import 'package:uhr/utils/config.dart';

final timerChangeNotifierProvider = ChangeNotifierProvider<MyTimer>((ref) {
  return MyTimer();
});

final databaseChangeNotifierProvider =
ChangeNotifierProvider<DatabaseHelper>((ref) {
  return DatabaseHelper.instance;
});

final themeChangeNotifierProvider = ChangeNotifierProvider<CustomTheme>((ref) {
  return CustomTheme();
});

final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotification();
  await EasyLocalization.ensureInitialized();

  setupServices();
  await services.allReady();

  runApp(
    ProviderScope(
      child: EasyLocalization(
          startLocale: const Locale('en', 'US'),
          supportedLocales: supportedLocales,
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
    final CustomTheme theme = ref.watch(themeChangeNotifierProvider)
      ..initializeThemeMode();

    return MaterialApp(
      home: MaterialApp.router(
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
        themeMode: theme.themeMode,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
