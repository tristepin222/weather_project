import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/weather.dart';
import 'package:weather_project/screens/search.dart';
import 'package:weather_project/weather_system.dart';
import '../util/weather.dart';
import '../util/temperature.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key,required this.weatherdata}) : super(key: key);
  final Weather? weatherdata;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  WeatherSystem weatherSystem = WeatherSystem();
  Weather? weather;


  getDataSelf()  {
    return widget.weatherdata;
  }
  Future<Weather> reloadSelf() async{
    return await weatherSystem.getWeather();
  }

  TextEditingController textController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {




    weather = getDataSelf();
    String cityName = weather?.areaName ?? "Sainte-croix"; //city name
    int currTemp =
        weather?.temperature?.celsius?.toInt() ?? 20; // current temperature
    int maxTemp =
        weather?.tempMax?.celsius?.toInt() ?? 10; // today max temperature
    int minTemp =
        weather?.tempMin?.celsius?.toInt() ?? 0; // today min temperature
    String currShortDesc = weather?.weatherMain.toString() ?? "cloudy";
    String iconCode = weather?.weatherIcon ?? "03d";
    Size size = MediaQuery.of(context).size;
    bool isDarkMode = false;
    return MaterialApp(
     home: Scaffold(
        backgroundColor: getColorBGFromTemp(currTemp),

        body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: getImageFromWeatherType(weather?.weatherConditionCode ?? 200),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.01,
                          horizontal: size.width * 0.05,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Builder(
                                builder: (context) => IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.map,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const SearchPage()),
                                );
                              },

                            )
                            ),
                            Align(
                              child: Text(
                                'Weather Project',
                                style: GoogleFonts.questrial(
                                  color: isDarkMode
                                      ? Colors.white
                                      : const Color(0xff1D1617),
                                  fontSize: size.height * 0.02,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.locationCrosshairs,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                              onPressed: () async{
                                Weather weather = await reloadSelf();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomePage(weatherdata: weather)
                                  ),
                                );
                              },

                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.1,
                        ),
                        child: Align(
                          child: Text(
                            cityName,
                            style: GoogleFonts.questrial(
                              color: isDarkMode ? Colors.white : Colors.black,
                              fontSize: size.height * 0.06,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.01,
                        ),
                        child: Align(
                          child: Text(
                            'Today', //day
                            style: GoogleFonts.questrial(
                              color:
                                  isDarkMode ? Colors.white54 : Colors.black54,
                              fontSize: size.height * 0.035,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.04,
                        ),
                        child: Align(
                          child: Image.network(
                              'https://openweathermap.org/img/wn/$iconCode@2x.png'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.04,
                        ),
                        child: Align(
                          child: Text(
                            '$currTemp˚C', //curent temperature
                            style: GoogleFonts.questrial(
                              color: getColorFromTemp(currTemp),
                              fontSize: size.height * 0.13,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.25),
                        child: Divider(
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.005,
                        ),
                        child: Align(
                          child: Text(
                            currShortDesc, // weather
                            style: GoogleFonts.questrial(
                              color:
                                  isDarkMode ? Colors.white54 : Colors.black54,
                              fontSize: size.height * 0.03,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.03,
                          bottom: size.height * 0.01,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$minTemp˚C', // min temperature
                              style: GoogleFonts.questrial(
                                color: getColorFromTemp(minTemp),
                                fontSize: size.height * 0.03,
                              ),
                            ),
                            Text(
                              '/',
                              style: GoogleFonts.questrial(
                                color: isDarkMode
                                    ? Colors.white54
                                    : Colors.black54,
                                fontSize: size.height * 0.03,
                              ),
                            ),
                            Text(
                              '$maxTemp˚C', //max temperature
                              style: GoogleFonts.questrial(
                                color: getColorFromTemp(maxTemp),
                                fontSize: size.height * 0.03,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
     )
    );

  }
}
