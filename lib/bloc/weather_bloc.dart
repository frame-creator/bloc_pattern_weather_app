import 'package:bloc_pattern_weather_app/model/weather_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc_pattern_weather_app/resources/bloc_repository.dart';

class WeatherBloc {
  var repository = Repository();
  var weatherObject = PublishSubject<WeatherModel>();

  WeatherBloc() {
    fetch();
  }

  void fetch() async {
    var weatherModel = await repository.fetchWeather();
    weatherObject.add(weatherModel);
  }

  Stream<WeatherModel> get weatherModel => weatherObject.stream;
}
