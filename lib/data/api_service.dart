import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:weather_app/widget/model.dart';

class WeatherApi {
  final dio = Dio();
  late String result;
  late String sonuc;
  String url =
      "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=mersin";
  Map<String, dynamic> headers = {
    'Authorization': 'apikey 0PIRJpwRzV3XgcUzDnHVOc:3MZb9iCBzKPEO2A47AhNFE',
    'content-type': 'application/json'
  };

  Future<List<Weather>?> getLocation(sehirAdi) async {
    final gelenCevap =
        await dio.get(url + sehirAdi, options: Options(headers: headers));
    if (gelenCevap.statusCode != 200) {
      return Future.error("hata");
    }
    //final Map gelenCevapJson = jsonDecode(gelenCevap.data);
    final List<dynamic> list = gelenCevap.data["result"];
    final List<Weather> sonuc = list.map((e) => Weather.fromJson(e)).toList();

    print(gelenCevap.data);
    return sonuc;
  }
}
