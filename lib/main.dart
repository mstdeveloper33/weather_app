import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/hava_2/weather_view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: WeatherView(),
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.teal.shade200,
          appBarTheme: const AppBarTheme(
              centerTitle: true,
              backgroundColor: Colors.blueGrey,
              systemOverlayStyle: SystemUiOverlayStyle.light,
              elevation: 10)),
    );
  }
}
