import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt services = GetIt.instance;

void setupServices() {
  services.registerSingletonAsync<SharedPreferences>(() async => SharedPreferences.getInstance());
}
