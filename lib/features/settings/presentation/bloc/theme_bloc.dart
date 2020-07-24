import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:terafits/core/util/app_themes.dart';
import 'package:terafits/core/util/shared_preferences_util.dart';

import 'bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState => ThemeState(
      themeData: appThemeData[SharedPreferencesUtil.getIsDarkTheme()
          ? AppTheme.DarkTheme
          : AppTheme.LightTheme]);

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ThemeChanged) {
      yield ThemeState(themeData: appThemeData[event.theme]);
    }
  }
}
