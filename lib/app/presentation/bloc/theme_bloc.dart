import 'dart:async';

import 'package:app_anime/app/domain/entities/theme_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:app_anime/app/domain/usecases/get_current_theme_usercase.dart';
import 'package:app_anime/core/usecases/usecase.dart';

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
    if(event is SwitchThemeEvent){
      if(this.state is DarkThemeState){
        yield LigthThemeState();
      }else {
        yield DarkThemeState();
      }
    }else if(event is GetCurrentThemeEvent){
      final currentTheme = await _getCurrentThemeUsercase(NoParams());
      yield currentTheme.fold(
        (failure) => LigthThemeState(),
        (themeEntity) {
          if(themeEntity.currentTheme == TypesThemes.dark){
            return LigthThemeState();
          }
          return LigthThemeState();
        }
      );
    }
  }
}
