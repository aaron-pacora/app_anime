import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {

  @override
  ThemeState get initialState {
    DateTime now = DateTime.now();
    if(now.hour >= 6 && now.hour <= 18){
      return LigthThemeState();
    }
    return DarkThemeState();
  }

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if(event is SwitchThemeEvent){
      if(this.state is DarkThemeState){
        yield LigthThemeState();
      }else {
        yield DarkThemeState();
      }
    }
  }
}
