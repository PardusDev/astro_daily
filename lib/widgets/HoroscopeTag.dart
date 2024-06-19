import 'package:flutter/material.dart';

import '../models/Horoscope.dart';
import '../models/Tag.dart';
import 'HoroscopeTagButton.dart';

class HoroscopeTag extends StatelessWidget {
  final Horoscope selectedHoroscope;
  final List<Tag> tags;
  const HoroscopeTag({super.key, required this.tags, required this.selectedHoroscope});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: (tags.length / 2).ceil(),
      itemBuilder: (context, index) {
        final int firstIndex = index * 2;
        final int secondIndex = firstIndex + 1;
        return Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HoroscopeTagButton(selectedHoroscope: selectedHoroscope, tag: tags[firstIndex],),
              SizedBox(height: 12,),
              if (secondIndex < tags.length) HoroscopeTagButton(selectedHoroscope: selectedHoroscope, tag: tags[secondIndex])
            ],
          ),
        );
      },
    );
  }
}
