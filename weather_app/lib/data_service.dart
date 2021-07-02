import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models.dart';

class DataService {
  Future<WeatherResponse> getWeather (String city) async {
    // "https://api.openweathermap.org/data/2.5/weather?q=asaba&appid=435993cb111961cf1411bdf830d30556&units=metric"
  final queryParameters = {
    'q': city,
    'appid': '435993cb111961cf1411bdf830d30556',
    'units': 'metric'
  };

  final uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', queryParameters);

  final response = await http.get(uri);

  print(response.body);
  final json = jsonDecode(response.body);
  return WeatherResponse.fromJson(json);
  }
}