import 'package:bloc_pattern_weather_app/model/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bloc_pattern_weather_app/main.dart';
import 'dart:convert' as convert;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherModel _weather;

  Future<WeatherModel> fetchData() async {
    var address = 'http://api.airvisual.com/v2/nearest_city?';
    final url = Uri.parse(address);
    var response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body);
    var code = jsonResponse['status'];

    WeatherModel weather = WeatherModel.fromJson(jsonResponse);
    return weather;
  }

  @override
  void initState() {
    super.initState();
    fetchData().then((WeatherModel) {
      setState(() {
        _weather = WeatherModel;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _weather == null
          ? CircularProgressIndicator()
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${_weather.data.current.pollution.aqius}',
                  ),
                ],
              ),
            ),
    );
  }
}
