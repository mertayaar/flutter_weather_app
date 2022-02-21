// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/widgets/gradient_container.dart';
import 'package:weather_app/presentation/widgets/last_update.dart';
import 'package:weather_app/presentation/widgets/location.dart';
import 'package:weather_app/presentation/widgets/max_min_temp.dart';
import 'package:weather_app/presentation/widgets/weather_img.dart';

import '../blocs/ThemaBloc/tema_bloc.dart';
import '../blocs/WeatherBloc/weather_bloc.dart';
import 'widgets/select_city.dart';

class WeatherMainPage extends StatelessWidget {
  String? selectedCity;
  Completer<void> _refreshComplater = Completer<void>();
  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        actions: [
          IconButton(
            onPressed: () async {
              selectedCity = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SelectCity(),
                ),
              );
              if (selectedCity != null) {
                _weatherBloc.add(FetchWeatherEvent(cityName: selectedCity));
              }
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder(
          bloc: _weatherBloc,
          builder: (context, WeatherState state) {
            if (state is WeatherInitial) {
              return const Center(
                child: Text("Type a city"),
              );
            }
            if (state is WeatherLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is WeatherLoaded) {
              final weather = state.weather;
              selectedCity = weather!.title;
              final _havaDurumuKisaltma =
                  weather.consolidatedWeather![0].weatherStateAbbr;
              BlocProvider.of<TemaBloc>(context)
                  .add(ChangeThemeEvent(weather: _havaDurumuKisaltma));

              _refreshComplater.complete();
              _refreshComplater = Completer();
              //getirilenWeather.consolidatedWeather[0].
              return BlocBuilder(
                bloc: BlocProvider.of<TemaBloc>(context),
                builder: (context, TemaState temaState) {
                  return GradientContainer(
                    color: (temaState as AppTheme).renk,
                    child: RefreshIndicator(
                      onRefresh: () {
                        _weatherBloc.add(
                          RefreshWeatherEvent(cityName: selectedCity),
                        );
                        return _refreshComplater.future;
                      },
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: LocationWidget(
                              cityName: weather.title,
                            )),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(child: LastUpdate()),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(child: WeatherImage()),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Center(child: MaxMinTemp()),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            if (state is WeatherErrorState) {
              return const Center(
                child: Text("Error"),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
