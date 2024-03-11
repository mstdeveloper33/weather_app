import 'package:dio/dio.dart';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/hava_2/weather_model.dart';

class WeatherServices {
  Future<String?> getLocation() async {
    //Kullanıcının konumu açık mı değil mi kontrol et
    final bool serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      Future.error("Konum servisiniz kapalı");
    }

    //Kullanıcı konum izni vermiş mi vermemiş mi kontrol et
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      //Konum izni vermemşse tekrar izin istedik
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Konum izni verilmemişse hata döndürülür.
        Future.error("Konum izni vermelisiniz");
      }
    }

    //Kullanıcının pozisyonunu aldık
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // Kullanıcı pozisyonundan yerleşim noktasını bulduk
    var placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    // Şehirlerimizi yerleşim noktasından kaydettik
    final String? city = placemark[0].administrativeArea;
    if (city == null) Future.error("Bir sorun oluştu");
    return city!;
  }

  Future<List<WeatherModels>?> getWeatherData() async {
    final String? city = await getLocation(); 
    final String url =
        "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$city";
    const Map<String, dynamic> headers = {
      'Authorization': 'apikey 0PIRJpwRzV3XgcUzDnHVOc:3MZb9iCBzKPEO2A47AhNFE',
      'content-type': 'application/json'
    };

    final dio = Dio();
    final response = await dio.get(url, options: Options(headers: headers));
    if (response.statusCode != 200) {
      return Future.error("Bir Sorun oluştu");
    }

    final Map<String, dynamic> responseData = response.data;

    final List<dynamic> list = responseData["result"];

    final List<WeatherModels> weatherList =
        list.map((e) => WeatherModels.fromJson(e)).toList();
    print(response.data);
    return weatherList;
  }
}
