
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../data/weather_repository.dart';
import '../../locator.dart';
import '../../models/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository = locator<WeatherRepository>();

  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      if (event is FetchWeatherEvent) {
        emit(WeatherLoadingState());
        try {
          final Weather? weather =
              await weatherRepository.getWeather(event.cityName!);
          emit(WeatherLoaded(weather: weather));
        } catch (e) {
          emit(WeatherErrorState());
        }
      } else if (event is RefreshWeatherEvent) {
        try {
          final Weather? getirilenWeather =
              await weatherRepository.getWeather(event.cityName!);
          emit(WeatherLoaded(weather: getirilenWeather));
        } catch (e) {
          emit(state);
        }
      }
    });
  }
}
