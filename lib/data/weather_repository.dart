import 'package:weather_app/locator.dart';
import 'package:weather_app/data/api_service.dart';
import 'package:weather_app/widget/model.dart';

class WeatherRepository {
  WeatherApi weatherApiClient = locator<WeatherApi>();

  Future<Weather?> getWeather(String sehir) async {
    return null;
  }
}
