import 'package:dio/dio.dart';

class WeatherApiClient {
  Future<void> getWeatherData() async {
    String url =
        "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=ankara";
    const Map<String, dynamic> headers = {
      'authorization ': 'apikey 0PIRJpwRzV3XgcUzDnHVOc:3MZb9iCBzKPEO2A47AhNFE',
      'content-type': 'application/json'
    };

    final dio = Dio();
    final response = await dio.get(url, options: Options(headers: headers));
    if (response.statusCode != 200) {
      return Future.error("Bir Sorun oluştu");
    }
  }
}
