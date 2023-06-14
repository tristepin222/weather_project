import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_project/weather_system.dart';

Color? getColorFromTemp(int temp){

  if(temp <= 0){
   return Colors.blue[900];
  }
  if(temp >  0 && temp <= 15){
   return Colors.blue[400];
  }
  if(temp > 15 && temp < 30){
    return Colors.yellow[400];
  }

  return Colors.red[900];
}

Color? getColorBGFromTemp(int temp){

  if(temp <= 0){
    return Colors.blue[400];
  }
  if(temp >  0 && temp <= 15){
    return Colors.blue[100];
  }
  if(temp > 15 && temp < 30){
    return Colors.yellow[100];
  }

  return Colors.red[400];
}