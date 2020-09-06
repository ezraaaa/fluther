import 'dart:convert' as convert;

import 'package:fluther/home/models/location_weather/location_weather.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class WeatherRepository {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String apiKey = 'a54311863e7e38a6674b331d7a1b871e';

  Future<LocationWeather> fetchCityWeather(
      {@required double latitude, @required double longitude}) async {
    final String locationUrl =
        '$baseUrl/onecall?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey';
    final http.Response weatherResponse = await http.get(locationUrl);

    if (weatherResponse.statusCode == 200) {
      final Map<String, dynamic> weatherJson =
          convert.jsonDecode(weatherResponse.body) as Map<String, dynamic>;
      return LocationWeather.fromJson(weatherJson);
    } else {
      final int statusCode = weatherResponse.statusCode;
      throw Exception('Error: $statusCode');
    }
  }
}
