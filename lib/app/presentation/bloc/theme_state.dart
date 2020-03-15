part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  final Brightness brightness;
  ThemeState({@required this.brightness});
  @override
  List<Object> get props => [];

}

class DarkThemeState extends ThemeState {
  final Brightness brightness = Brightness.dark;
}

class LigthThemeState extends ThemeState {
  final Brightness brightness = Brightness.light;
}
