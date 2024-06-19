import 'Horoscope.dart';
import 'Tag.dart';

class TagDetails {
  final int id;
  final Tag existingTag;
  final Horoscope existingHoroscope;
  final String comment;

  TagDetails({required this.id, required this.existingTag, required this.existingHoroscope, required this.comment});

  factory TagDetails.fromJson(Map<String, dynamic> json, Tag existingTag, Horoscope existingHoroscope) {
    return TagDetails(
      id: json["id"],
      existingTag: existingTag,
      existingHoroscope: existingHoroscope,
      comment: json["comment"]
    );
  }
}