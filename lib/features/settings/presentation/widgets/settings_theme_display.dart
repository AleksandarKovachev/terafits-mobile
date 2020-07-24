import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terafits/core/util/app_themes.dart';
import 'package:terafits/core/util/shared_preferences_util.dart';
import 'package:terafits/core/util/translations.dart';
import 'package:terafits/features/settings/presentation/bloc/bloc.dart';

class SettingsThemeDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        title: Text(Translations.of(context).text('settings_theme_change')),
        value: SharedPreferencesUtil.getIsDarkTheme(),
        onChanged: (value) {
          SharedPreferencesUtil.setIsDarkTheme(value);
          BlocProvider.of<ThemeBloc>(context).add(ThemeChanged(
              theme: value ? AppTheme.DarkTheme : AppTheme.LightTheme));
        },
        secondary: const Icon(Icons.lightbulb_outline));
  }
}
