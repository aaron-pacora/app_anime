part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SwitchThemeEvent extends ThemeEvent {}

class GetCurrentThemeEvent extends ThemeEvent {}