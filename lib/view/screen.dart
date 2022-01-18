import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:bloc_pattern_weather_app/model/weather_model.dart';
import 'package:bloc_pattern_weather_app/bloc/weather_bloc.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final weatherBloc = WeatherBloc();

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<WeatherModel>(
            stream: weatherBloc.weatherModel,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return weatherCard(snapshot.data);
              } else {
                return CircularProgressIndicator();
              }
            }));
  }

  Widget weatherCard(WeatherModel weather) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Container(
          height: screenHeight,
          width: screenWidth,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/sky.jpg'), fit: BoxFit.cover)),
        ),
        Positioned(
          top: screenHeight / 2 + 20,
          left: 25.0,
          right: 25.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.cloudMoon,
                      color: Colors.white,
                      size: 40,
                    ),
                    SizedBox(width: 5.0),
                    FaIcon(
                      FontAwesomeIcons.mapMarkedAlt,
                      color: Colors.white,
                      size: 40,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 2.0,
                color: Colors.white,
              ),
              SizedBox(height: 15.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('${weather.data.current.weather.tp}',
                        style: TextStyle(
                            fontSize: 70.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Text('°C',
                        style: TextStyle(
                          fontSize: 50.0,
                          color: Colors.white,
                        )),
                  ]),
              SizedBox(height: 45.0),
              Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.industry,
                      color: Colors.white,
                      size: 40,
                    ),
                    SizedBox(width: 2.0),
                    FaIcon(
                      FontAwesomeIcons.tint,
                      color: Colors.white,
                      size: 40,
                    ),
                    SizedBox(width: 5.0),
                    FaIcon(
                      FontAwesomeIcons.wind,
                      color: Colors.white,
                      size: 40,
                    ),
                    SizedBox(width: 3.0),
                  ],
                ),
              ),
              SizedBox(height: 15.0),
              Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('${weather.data.current.pollution.aqius}',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Text('',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('${weather.data.current.weather.hu}',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Text('%',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('${weather.data.current.weather.ws}',
                              style: TextStyle(
                                  //           fontFamily: 'Inconsolata',
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Text('m/s',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ]),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
