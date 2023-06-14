import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_project/weather_system.dart';

AssetImage getImageFromWeatherType(int type){

  String imagePath = "assets/images/lighting.jpg";
if(type >= 200 && type <= 232){
  imagePath = "assets/images/lighting.jpg";
}
  if(type >= 300 && type <= 321){
    imagePath = "assets/images/heavyrain.jpg";
  }
  if(type >= 500 && type <= 531){
    imagePath = "assets/images/heavyrain.jpg";
  }
  if(type >= 600 && type <= 622){
    imagePath = "assets/images/snoww.jpg";
  }
  if(type >= 701 && type <= 781){
    imagePath = "assets/images/mist.jpg";
  }
  if(type >= 801 && type <= 804){
    imagePath = "assets/images/fewclouds.jpg";
  }
  if(type == 800){
    imagePath = "assets/images/clearsky.jpg";
  }
return AssetImage(imagePath);

}