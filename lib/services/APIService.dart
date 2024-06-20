import 'dart:convert';

import 'package:astro_daily/models/HoroscopeDetails.dart';
import 'package:http/http.dart' as http;
import '../models/Horoscope.dart';
import '../models/Tag.dart';
import '../models/TagDetails.dart';

class APIService {
  String apiUrl = "http://10.0.2.2:3000";

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

  Future<List<Tag>> getTags() async {
    final String uri = "$apiUrl/getTags";
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      return Tag.fromJsonList(json);
    } else {
      throw Exception('Failed to load horoscope data.');
    }
  }

  Future<TagDetails> getTagDetail(Horoscope existingHoroscope, Tag existingTag) async {
    final String uri = "$apiUrl/getTagDetail?horoscopeId=${existingHoroscope.id}&tagId=${existingTag.id}";
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      return TagDetails.fromJson(jsonDecode(response.body), existingTag, existingHoroscope);
    } else {
      throw Exception('Failed to load horoscope details data.');
    }
  }
}