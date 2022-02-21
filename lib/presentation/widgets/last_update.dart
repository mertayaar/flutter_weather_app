part of '../weather_main.dart';


class LastUpdate extends StatelessWidget {
  const LastUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return BlocBuilder(
      bloc: _weatherBloc,
      builder: (context, WeatherState state) {
        var yeniTarih = (state as WeatherLoaded).weather!.time!.toLocal();
        return Text(
          "Last Update:  " + TimeOfDay.fromDateTime(yeniTarih).format(context),
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        );
      },
    );
  }
}
