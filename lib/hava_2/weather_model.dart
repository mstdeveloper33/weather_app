class WeatherModels {
  final String? gun;
  final String? ikon;
  final String? durum;
  final int? derece;
  final int? min;
  final int? max;
  final int? gece;
  final String? nem;

  WeatherModels(this.gun, this.ikon, this.durum, this.derece, this.min,
      this.max, this.gece, this.nem);

  WeatherModels.fromJson(Map<String, dynamic> json)
      : gun = json["day"],
        ikon = json["icon"],
        durum = json["description"],
        derece = (int.parse(json["degree"].split(".")[0])),
        min = (int.parse(json["min"].split(".")[0])),
        max = (int.parse(json["max"].split(".")[0])),
        gece = (int.parse(json["night"].split(".")[0])),
        nem = json["humidity"];
}
