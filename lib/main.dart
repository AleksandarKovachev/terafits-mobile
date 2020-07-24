import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logging/logging.dart';
import 'package:terafits/home_page.dart';

import 'core/util/shared_preferences_util.dart';
import 'core/util/translations.dart';
import 'features/settings/presentation/bloc/bloc.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _setupLogging();
  await di.init();
  runApp(MyApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SpecificLocalizationDelegate _localeOverrideDelegate;

  @override
  void initState() {
    super.initState();
    Translations.onLocaleChanged = onLocaleChange;
    _localeOverrideDelegate =
        new SpecificLocalizationDelegate(Locale('en', ''));
    Translations.onLocaleChanged(
        Locale(SharedPreferencesUtil.getSelectedLanguage(), ''));
  }

  onLocaleChange(Locale locale) {
    setState(() {
      _localeOverrideDelegate = new SpecificLocalizationDelegate(locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<ThemeBloc>(),
      child: BlocBuilder<ThemeBloc, ThemeState>(builder: _buildWithTheme),
    );
  }

  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    return MaterialApp(
      title: 'Terafits',
      debugShowCheckedModeBanner: false,
      theme: state.themeData,
      home: HomePage(),
      localizationsDelegates: [
        _localeOverrideDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: Translations.supportedLocales(),
    );
  }
}
