import 'package:flutter/material.dart';
import 'package:weather_app/hava_2/weather_model.dart';
import 'package:weather_app/hava_2/weather_services_version2.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  List<WeatherModels> _weathers = [];

  void _getWeatherData() async {
    _weathers = (await WeatherServices().getWeatherData())!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getWeatherData();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: _weathers.length,
          itemBuilder: (context, index) {
            final WeatherModels weather = _weathers[index];
            return Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Image.network(weather.ikon ?? "", width: 100),
                  Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 25),
                    child: Text(
                      "${weather.gun} \n ${weather.durum?.toUpperCase() ?? ""} ${weather.derece}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Min : ${weather.min}"),
                          Text("Max : ${weather.max}"),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Gece : ${weather.gece}"),
                          Text("Nem : ${weather.nem} "),
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
