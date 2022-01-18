import 'package:bloc_pattern_weather_app/model/weather_model.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class WeatherProvider {
  Future<WeatherModel> fetchData() async {
    var address = 'http://api.airvisual.com/v2/nearest_city?';
    final url = Uri.parse(address);
    var response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonResponse);
    } else {
      throw Exception('${response.statusCode}');
    }
  }
}
