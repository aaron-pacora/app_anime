part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  final ThemeMode themeMode;
  ThemeState({@required this.themeMode});
  @override
  List<Object> get props => [];

}

class DarkThemeState extends ThemeState {
  final ThemeMode themeMode = ThemeMode.dark;
}

class LigthThemeState extends ThemeState {
  final ThemeMode themeMode = ThemeMode.light;
}
