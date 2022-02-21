import '../locator.dart';
import '../models/weather_model.dart';
import 'weather_api_client.dart';

class WeatherRepository {
  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();
  Future<Weather> getWeather(String city) async {
    final int cityID = await weatherApiClient.getLocationID(city);
    return await weatherApiClient.getWeather(cityID);
  }
}
