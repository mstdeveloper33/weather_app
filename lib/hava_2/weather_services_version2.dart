// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:weather_app/hava_2/weather_model.dart';

// class WeatherApiClient {
//   final String city;

//   WeatherApiClient({required this.city});
//   Future<List<WeatherModels>?> getWeatherData() async {
//     String url =
//         "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$city";
//     const Map<String, dynamic> headers = {
//       'Authorization': 'apikey 0PIRJpwRzV3XgcUzDnHVOc:3MZb9iCBzKPEO2A47AhNFE',
//       'content-type': 'application/json'
//     };

//     final dio = Dio();
//     final response = await dio.get(url, options: Options(headers: headers));
//     if (response.statusCode != 200) {
//       return Future.error("Bir Sorun oluştu");
//     }

//     final Map<String, dynamic> responseData = response.data;

//     final List<dynamic> list = responseData["result"];

//     final List<WeatherModels> weatherList =
//         list.map((e) => WeatherModels.fromJson(e)).toList();
//     print(response.data);
//     return weatherList;
//   }
// }
