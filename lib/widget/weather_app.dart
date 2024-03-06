import 'package:flutter/material.dart';
import 'package:weather_app/widget/hava_durumu_resim.dart';
import 'package:weather_app/widget/location.dart';
import 'package:weather_app/widget/max_min_sicaklik.dart';
import 'package:weather_app/widget/sehir_sec.dart';
import 'package:weather_app/widget/son_guncelleme.dart';
import 'package:weather_app/widget/weather_services.dart';

// ignore: must_be_immutable
class WeatherApp extends StatefulWidget {
  WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  String kullanicininSectigiSehir = "Ankara";

  @override
  void initState() {
    super.initState();
    WeatherApiClient().getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.elliptical(40, 40))),
        title: const Text("Weather App"),
        actions: [
          IconButton(
            onPressed: () async {
              kullanicininSectigiSehir =
                  await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SehirSecWidget(),
              ));
              debugPrint(kullanicininSectigiSehir);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: LocationWidget(
                  secilenSehir: kullanicininSectigiSehir,
                ),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SonGuncellemeWidget(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: HavaDurumuResimWidget(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: MaxveMinSicaklikWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
