import 'package:flutter/material.dart';
import 'package:terafits/core/util/shared_preferences_util.dart';
import 'package:terafits/core/util/translations.dart';

class SettingsLanguageDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.language),
      title: Text(Translations.of(context).text('settings_language_change')),
      trailing: DropdownButton(
        value: SharedPreferencesUtil.getSelectedLanguage(),
        items: Translations.supportedLanguages.map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        onChanged: (value) {
          Translations.onLocaleChanged(new Locale(value, ''));
          SharedPreferencesUtil.setSelectedLanguage(value);
        },
      ),
      onTap: () {},
    );
  }
}
