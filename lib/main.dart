import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_project/screens/home_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_project/weather_system.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  WeatherSystem weatherSystem = WeatherSystem();
  Weather? weather;
  Widget _body = const CircularProgressIndicator();  // Default Body

  @override
  void initState(){
    _gotoHomeScreen();
  }

  @override
  Widget build(BuildContext context){
    return Center(
     child: _body
    );
  }

  Widget _gotoHomeScreen() {
    weatherSystem.getWeather().then((value){
      setState(() => _body = HomePage(weatherdata: value));
    });
    return widget;
  }
}
