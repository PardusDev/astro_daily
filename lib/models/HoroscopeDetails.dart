import 'Horoscope.dart';

class HoroscopeDetails {
  final Horoscope horoscope;
  final String todayText;
  final String tomorrowText;
  final String weeklyText;

  HoroscopeDetails({required this.horoscope, required this.todayText, required this.tomorrowText, required this.weeklyText});

  factory HoroscopeDetails.fromJson(Map<String, dynamic> json, Horoscope existingHoroscope) {
    return HoroscopeDetails(
        horoscope: existingHoroscope,
        todayText: json["todaysInterpretation"][0]["interpretation"],
        tomorrowText: json["tomorrowsInterpretation"][0]["interpretation"],
        weeklyText: json["weeklyInterpretation"][0]["interpretation"],
    );
  }

  bool get isEmpty {
    return todayText.isEmpty && tomorrowText.isEmpty && weeklyText.isEmpty;
  }

  bool get isNotEmpty {
    return todayText.isNotEmpty || tomorrowText.isNotEmpty || weeklyText.isNotEmpty;
  }
}