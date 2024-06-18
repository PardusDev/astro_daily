class Horoscope {
  final int id;
  final String name;
  final String dateInterval;
  final String assetPath;

  Horoscope({required this.name, required this.dateInterval, required this.assetPath, required this.id});

  factory Horoscope.fromJson(Map<String, dynamic> json) {
    return Horoscope (
      id: json["id"],
      name: json["name"],
      dateInterval: json["dateInterval"],
      assetPath: json["assetPath"]
    );
  }

  static List<Horoscope> fromJsonList(List<dynamic> list) {
    return list.map((item) => Horoscope.fromJson(item)).toList();
  }
}