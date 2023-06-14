import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_project/weather_type.dart';
import 'package:weather_project/geolocation_system.dart';

class WeatherSystem {
  WeatherType? weatherType;
  WeatherFactory weatherFactory =
      WeatherFactory("a0befe20eea4fc5302de5bfc6337e835");
  GeolocationSystem geolocationSystem = GeolocationSystem();

  Future<Weather> getWeather() async {
    await geolocationSystem.getLocation();
    Weather weatherData = await weatherFactory.currentWeatherByLocation(
        geolocationSystem.latitude, geolocationSystem.longitude);
    return weatherData;
  }

  Future<Weather> getWeatherFromCity(String city) async {
    Weather weatherData = await weatherFactory.currentWeatherByCityName(city);
    return weatherData;
  }
}
