import 'package:flutter/material.dart';

enum WeatherState {
  InitialWeatherState,
  WeatherLoadingState,
  WeatherLoadedState,
  WeatherErrorState
}

class WeatherViewModel with ChangeNotifier {
 late WeatherState _state;


  WeatherViewModel() {
    _state = WeatherState.InitialWeatherState;
  }
  WeatherState get state => _state;
  set state(WeatherState value) {
    _state = value;
    notifyListeners();
  }
}
