import 'package:terafits/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String IS_DARK_THEME = "IS_DARK_THEME";
const String SELECTED_LANGUAGE = "SELECTED_LANGUAGE";

class SharedPreferencesUtil {
  static String getSelectedLanguage() {
    return sl<SharedPreferences>().getString(SELECTED_LANGUAGE) ?? 'en';
  }

  static setSelectedLanguage(String selectedLanguage) {
    sl<SharedPreferences>().setString(SELECTED_LANGUAGE, selectedLanguage);
  }

  static bool getIsDarkTheme() {
    return sl<SharedPreferences>().getBool(IS_DARK_THEME) ?? true;
  }

  static setIsDarkTheme(bool isDarkTheme) {
    sl<SharedPreferences>().setBool(IS_DARK_THEME, isDarkTheme);
  }
}
