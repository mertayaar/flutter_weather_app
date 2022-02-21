import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/ThemaBloc/tema_bloc.dart';
import 'blocs/WeatherBloc/weather_bloc.dart';
import 'locator.dart';
import 'presentation/weather_main.dart';

void main() {
  setupLocator();
  runApp(BlocProvider<TemaBloc>(
      create: (context) => TemaBloc(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<TemaBloc>(context),
      builder: (context, TemaState state) => MaterialApp(
        title: 'Weather App',
        debugShowCheckedModeBanner: false,
        theme: (state as AppTheme).tema,
        home: BlocProvider<WeatherBloc>(
            create: (context) => WeatherBloc(), child: WeatherMainPage()),
      ),
    );
  }
}
