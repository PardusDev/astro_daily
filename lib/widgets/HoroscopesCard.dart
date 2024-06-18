import 'package:astro_daily/widgets/HoroscopeCardButton.dart';
import 'package:flutter/material.dart';

import '../models/Horoscope.dart';

class HoroscopesCard extends StatelessWidget {
  final List<Horoscope> horoscopes;
  const HoroscopesCard({super.key, required this.horoscopes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: (horoscopes.length / 2).ceil(),
        itemBuilder: (context, index) {
          final int firstIndex = index * 2;
          final int secondIndex = firstIndex + 1;
          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HoroscopeCardButton(horoscope: horoscopes[firstIndex]),
                if (secondIndex < horoscopes.length) HoroscopeCardButton(horoscope: horoscopes[secondIndex])
              ],
            ),
          );
        },
      );
  }
}
