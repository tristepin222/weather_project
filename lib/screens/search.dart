import 'dart:developer';

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/weather.dart';
import 'package:weather_project/screens/home_page.dart';
import 'package:weather_project/weather_system.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  WeatherSystem weatherSystem = WeatherSystem();
  Weather? weather;
  Future<Weather> getData(String cityName) async {
    return await weatherSystem
        .getWeatherFromCity(cityName)
        .then((value) => weather = value);
  }

  TextEditingController textController = TextEditingController(text: "Paris");
  String? _myData;
  @override
  void initState() {
    super.initState();
  }

  Future<Weather> _gotoHomeScreen(String cityName) async{
    return await weatherSystem.getWeatherFromCity(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color.fromARGB(255, 47, 3, 3),
                Color.fromARGB(255, 255, 107, 107),
                Color.fromARGB(255, 255, 107, 107),
                Color(0xffff6b6b),
                Color(0xffb79797),
              ],
              tileMode: TileMode.mirror,
            ),
          ),
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
            child: Column(
              children: [
                AnimSearchBar(
                  rtl: true,
                  width: 400,
                  color: const Color(0xffffb56b),
                  textController: textController,
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 26,
                  ),
                  onSuffixTap: () async {
                    final String text = textController.text;
                    Weather weather = await _gotoHomeScreen(text);
                    text == ""
                        ? log("No city entered")
                        : setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    HomePage(weatherdata: weather)
                              ),
                            );
                          });
                  },
                  style: GoogleFonts.questrial(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  onSubmitted: (String) {

                  },
                ),
              ],
            ),
          ),
        ));
  }
}
