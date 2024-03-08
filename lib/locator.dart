import 'package:get_it/get_it.dart';
import 'package:weather_app/data/weather_repository.dart';
import 'package:weather_app/data/api_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => WeatherRepository());
  locator.registerLazySingleton(() => WeatherApi());
}
