import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

typedef void LocaleChangeCallback(Locale locale);

class Translations {
  static final List<String> supportedLanguages = ['en','bg'];

  static Iterable<Locale> supportedLocales() => supportedLanguages.map<Locale>((lang) => new Locale(lang, ''));

  static LocaleChangeCallback onLocaleChanged;

  Translations(Locale locale) {
    this.locale = locale;
    _localizedValues = null;
  }

  Locale locale;
  static Map<dynamic, dynamic> _localizedValues;

  static Translations of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  String text(String key) {
    if (_localizedValues == null) {
      return '';
    }
    return _localizedValues[key] ?? '** $key not found**';
  }

  static Future<Translations> load(Locale locale) async {
    Translations translations = new Translations(locale);
    String jsonContent = await rootBundle
        .loadString("locale/strings_${locale.languageCode}.json");
    _localizedValues = json.decode(jsonContent);
    return translations;
  }

  get currentLanguage => locale.languageCode;
}

class SpecificLocalizationDelegate extends LocalizationsDelegate<Translations> {
  final Locale overriddenLocale;

  const SpecificLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => overriddenLocale != null;

  @override
  Future<Translations> load(Locale locale) =>
      Translations.load(overriddenLocale);

  @override
  bool shouldReload(LocalizationsDelegate<Translations> old) => true;
}
