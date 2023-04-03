import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uhr/enums/languages.dart';
import 'package:uhr/enums/theme_type.dart';
import 'package:uhr/main.dart';
import 'package:uhr/provider/settings/language_provider.dart';
import 'package:uhr/provider/settings/theme_provider.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final LanguageProvider language = ref.watch(languageChangeNotifierProvider);
    final CustomTheme theme = ref.watch(themeChangeNotifierProvider);
    ThemeType newTheme = theme.themeType;
    Languages newLanguage = language.getLocaleAsLanguages();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('settings'.tr()),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.popRoute();
          },
        ),
        elevation: 0.8,
        backgroundColor: Theme.of(context).backgroundColor,
        foregroundColor: Theme.of(context).textTheme.headline1?.color,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Card(
              margin: const EdgeInsets.fromLTRB(
                20,
                6,
                20,
                0,
              ),
              child: DropdownButtonFormField<ThemeType>(
                dropdownColor: Theme.of(context).backgroundColor,
                decoration: InputDecoration(
                  fillColor: Theme.of(context).backgroundColor,
                  filled: true,
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
                    'theme'.tr(),
                    style: TextStyle(
                      fontSize: 25,
                      color: Theme.of(context).textTheme.headline2?.color,
                    ),
                  ),
                ),
                value: theme.themeType,
                items: ThemeType.values.map((r) {
                  return DropdownMenuItem(
                    value: r,
                    child: Text(
                      r.asString(),
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline1?.color,),
                    ),
                  );
                }).toList(),
                onChanged: (val) {
                  newTheme = val!;
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Card(
              margin: const EdgeInsets.fromLTRB(
                20,
                6,
                20,
                0,
              ),
              child: DropdownButtonFormField<Languages>(
                dropdownColor: Theme.of(context).backgroundColor,
                decoration: InputDecoration(
                  fillColor: Theme.of(context).backgroundColor,
                  filled: true,
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
                    'language'.tr(),
                    style: TextStyle(
                      fontSize: 25,
                      color: Theme.of(context).textTheme.headline2?.color,
                    ),
                  ),
                ),
                value: language.getLocaleAsLanguages(),
                items: Languages.values.map((r) {
                  return DropdownMenuItem(
                    value: r,
                    child: Text(
                      r.asString(),
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline1?.color,),
                    ),
                  );
                }).toList(),
                onChanged: (val) {
                  newLanguage = val!;
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              language.setLanguage(newLanguage);
              theme.changeTheme(newTheme);
              context.popRoute();
            },
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).backgroundColor,
              onPrimary: Theme.of(context).textTheme.headline1?.color,
              elevation: 5,
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 30,
              ),
            ),
            child: Text('save'.tr()),
          ),
        ],
      ),
    );
  }
}
