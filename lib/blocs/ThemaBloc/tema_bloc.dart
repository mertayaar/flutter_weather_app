import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'tema_event.dart';
part 'tema_state.dart';

class TemaBloc extends Bloc<TemaEvent, TemaState> {
  TemaBloc() : super(AppTheme(tema: ThemeData.light(), renk: Colors.blue)) {
    on<TemaEvent>((event, emit) {
      if (event is ChangeThemeEvent) {
        AppTheme? appTheme;
        switch (event.weather) {
          case "sn": //karlı
          case "sl": //sulu kar
          case "h": //dolu
          case "t": //fırtına
          case "hc": // çok bulutlu
            appTheme = AppTheme(
                tema: ThemeData(primaryColor: Colors.blueGrey),
                renk: Colors.grey);
            break;

          case "hr": //ağır yağmurlu
          case "lr": // hafif yağmurlu
          case "s": //sağanak yağış
            appTheme = AppTheme(
                tema: ThemeData(primaryColor: Colors.indigoAccent),
                renk: Colors.indigo);
            break;
          case "lc": //az bulutlu
          case "c": // güneşli açık
            appTheme = AppTheme(
                tema: ThemeData(primaryColor: Colors.orangeAccent),
                renk: Colors.yellow);
            break;
        }
        emit(appTheme!);
      }
    });
  }

  Stream<TemaState> mapEventToState(TemaEvent event) async* {
    AppTheme? appTheme;
    if (event is ChangeThemeEvent) {
      switch (event.weather) {
        case "sn": //karlı
        case "sl": //sulu kar
        case "h": //dolu
        case "t": //fırtına
        case "hc": // çok bulutlu
          appTheme = AppTheme(
              tema: ThemeData(primaryColor: Colors.blueGrey),
              renk: Colors.grey);
          break;

        case "hr": //ağır yağmurlu
        case "lr": // hafif yağmurlu
        case "s": //sağanak yağış
          appTheme = AppTheme(
              tema: ThemeData(primaryColor: Colors.indigoAccent),
              renk: Colors.indigo);
          break;
        case "lc": //az bulutlu
        case "c": // güneşli açık
          appTheme = AppTheme(
              tema: ThemeData(primaryColor: Colors.orangeAccent),
              renk: Colors.yellow);
          break;
      }
      yield appTheme!;
    }
  }
}
