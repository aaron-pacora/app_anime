import 'dart:async';

import 'package:app_anime/app/domain/usecases/get_current_theme_usercase.dart';
import 'package:app_anime/core/usecases/usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {

  GetCurrentThemeUsercase _getCurrentThemeUsercase;

  ThemeBloc({
    @required GetCurrentThemeUsercase getCurrentThemeUsercase
  }): assert(getCurrentThemeUsercase != null),
  _getCurrentThemeUsercase = getCurrentThemeUsercase;

  @override
  ThemeState get initialState => DarkThemeState();

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if(event is SwitchTehemEvent){
      if(this.state is DarkThemeState){
        yield LigthThemeState();
      }else {
        yield DarkThemeState();
      }
      _getCurrentThemeUsercase(NoParams());
    }
  }
}
