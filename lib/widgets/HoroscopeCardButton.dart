import 'package:astro_daily/screens/horoscope_interpretation_screen.dart';
import 'package:flutter/material.dart';

import '../models/Horoscope.dart';

class HoroscopeCardButton extends StatelessWidget {
  final Horoscope horoscope;
  const HoroscopeCardButton({super.key, required this.horoscope});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double width = constraints.maxWidth * 0.8;

        // TODO: Apply created width variable to sizedbox's width
        return SizedBox(
          width: 160,
          child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/HoroscopeInterpretation');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  side: BorderSide(color: Colors.white, width: 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                            width: 70,
                            height: 70,
                            child: Image.asset(horoscope.asset,
                            )),
                      ),
                      Text(
                        horoscope.name.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "(" + horoscope.dateRange.toUpperCase() + ")",
                        style: TextStyle(
                            color: Colors.white30,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                      SizedBox(height: 15)
                    ],
                  ),
                ),
              )
          ),
        );
      } );
  }
}
