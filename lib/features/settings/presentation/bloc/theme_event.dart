import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:terafits/core/util/app_themes.dart';

@immutable
abstract class ThemeEvent extends Equatable {
  const ThemeEvent(List<AppTheme> list) : super();
}

class ThemeChanged extends ThemeEvent {
  final AppTheme theme;

  ThemeChanged({
    @required this.theme,
  }) : super([theme]);

  @override
  List<Object> get props => [theme];
}
