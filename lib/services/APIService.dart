import 'dart:convert';

import 'package:astro_daily/models/HoroscopeDetails.dart';
import 'package:http/http.dart' as http;
import '../models/Horoscope.dart';

class APIService {
  final String apiUrl;

  APIService({required this.apiUrl});

  Future<List<Horoscope>> getHoroscopes() async {
    final String uri = "$apiUrl/getHoroscopes";
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      return Horoscope.fromJsonList(json);
    } else {
      throw Exception('Failed to load horoscope data.');
    }
  }

  Future<HoroscopeDetails> getHoroscopeDetails(Horoscope existingHoroscope) async {
    final String uri = "$apiUrl/getHoroscopeInterpretation?horoscopeId=${existingHoroscope.id}";
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      return HoroscopeDetails.fromJson(jsonDecode(response.body), existingHoroscope);
    } else {
      throw Exception('Failed to load horoscope details data.');
    }
  }
}