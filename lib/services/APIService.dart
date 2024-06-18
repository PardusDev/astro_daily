import 'dart:convert';

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
}