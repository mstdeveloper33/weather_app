import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/widget/weather_app.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: WeatherApp(),
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.teal.shade200,
          appBarTheme: AppBarTheme(
              centerTitle: true,
              backgroundColor: Colors.blueGrey,
              systemOverlayStyle: SystemUiOverlayStyle.light,
              elevation: 10)),
    );
  }
}
