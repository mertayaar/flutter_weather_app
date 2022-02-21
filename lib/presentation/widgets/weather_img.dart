import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../blocs/WeatherBloc/weather_bloc.dart';

class WeatherImage extends StatelessWidget {
  const WeatherImage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return BlocBuilder(
      bloc: _weatherBloc,
      builder: (context, WeatherState state) {
        var imageID = (state as WeatherLoaded)
            .weather!
            .consolidatedWeather![0]
            .weatherStateAbbr;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                // ignore: unnecessary_cast
                (state as WeatherLoaded)
                        .weather!
                        .consolidatedWeather![0]
                        .theTemp!
                        .floor()
                        .toString() +
                    "°C",
                style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              SvgPicture.network(
                "https://www.metaweather.com/static/img/weather/" +
                    imageID! +
                    ".svg",
                width: 150,
                height: 150,
              ),
            ],
          ),
        );
      },
    );
  }
}