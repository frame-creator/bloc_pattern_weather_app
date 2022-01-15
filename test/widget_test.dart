import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:bloc_pattern_weather_app/main.dart';

void main() {
  test('api 테스트', () async {
    var address = 'http://api.airvisual.com/v2/nearest_city?';
    final url = Uri.parse(address);
    var response = await http.get(url);
    expect(response.statusCode, 200);
  });
}
