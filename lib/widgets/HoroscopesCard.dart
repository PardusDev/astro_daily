import 'package:astro_daily/widgets/HoroscopeCardButton.dart';
import 'package:flutter/material.dart';

import '../utilities/Horoscopes.dart';

class HoroscopesCard extends StatelessWidget {
  const HoroscopesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: (Horoscopes.length / 2).ceil(),
        itemBuilder: (context, index) {
          final int firstIndex = index * 2;
          final int secondIndex = firstIndex + 1;
          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HoroscopeCardButton(horoscope: Horoscopes[firstIndex]),
                if (secondIndex < Horoscopes.length) HoroscopeCardButton(horoscope: Horoscopes[secondIndex])
              ],
            ),
          );
        },
      );
  }
}
