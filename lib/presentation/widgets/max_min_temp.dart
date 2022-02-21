part of '../weather_main.dart';

class MaxMinTemp extends StatelessWidget {
  const MaxMinTemp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder(
      bloc: _weatherBloc,
      builder: (context, WeatherState state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Maksimum : " +
                  (state as WeatherLoaded)
                      .weather!
                      .consolidatedWeather![0]
                      .maxTemp!
                      .floor()
                      .toString() +
                  " °C",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "Minimum : " +
                  // ignore: unnecessary_cast
                  (state as WeatherLoaded)
                      .weather!
                      .consolidatedWeather![0]
                      .minTemp!
                      .floor()
                      .toString() +
                  " °C",
              style: const TextStyle(fontSize: 20),
            ),
          ],
        );
      },
    );
  }
}
