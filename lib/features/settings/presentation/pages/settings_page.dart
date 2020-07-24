import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terafits/core/util/app_themes.dart';
import 'package:terafits/core/util/shared_preferences_util.dart';
import 'package:terafits/core/util/translations.dart';
import 'package:terafits/features/settings/presentation/bloc/bloc.dart';
import 'package:terafits/features/settings/presentation/widgets/settings_language_display.dart';
import 'package:terafits/injection_container.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SettingsState();
}

class SettingsState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ThemeBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(Translations.of(context).text('settings')),
        ),
        body: Column(
          children: <Widget>[
            SwitchListTile(
                title: Text(Translations.of(context).text('settings_theme_change')),
                value: SharedPreferencesUtil.getIsDarkTheme(),
                onChanged: (value) {
                  setState(() {
                    SharedPreferencesUtil.setIsDarkTheme(value);
                    BlocProvider.of<ThemeBloc>(context).add(ThemeChanged(
                        theme: value ? AppTheme.DarkTheme : AppTheme.LightTheme));
                  });
                },
                secondary: const Icon(Icons.lightbulb_outline)),
            SettingsLanguageDisplay(),
          ],
        ),
      ),
    );
  }
}
