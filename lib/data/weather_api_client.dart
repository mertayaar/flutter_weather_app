import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherApiClient {
  static const baseUrl = "https://www.metaweather.com";
  final http.Client httpClient = http.Client();

  Future<int> getLocationID(String sehirAdi) async {
    final sehirURL = baseUrl + "/api/location/search/?query=" + sehirAdi;
    final gelenCevap = await httpClient.get(Uri.parse(sehirURL));

    if (gelenCevap.statusCode != 200) {
      //başarılı ise 200dür
      throw Exception("Veri Getirilemedi");
    }

    final gelenCevapJSON = (jsonDecode(gelenCevap.body)) as List;
    return gelenCevapJSON[0]["woeid"];
  }

  Future<Weather> getWeather(int cityID) async {
    final weatherURL = baseUrl + "/api/location/$cityID";
    final response = await httpClient.get(Uri.parse(weatherURL));
    if (response.statusCode != 200) {
      throw Exception("Hava Durumu Getirilemedi");
    }

    final weatherJson = jsonDecode(response.body);
    return Weather.fromJson(weatherJson);
  }
}
