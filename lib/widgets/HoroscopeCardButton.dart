import 'package:flutter/material.dart';

import '../models/Horoscope.dart';

class HoroscopeCardButton extends StatelessWidget {
  final Horoscope horoscope;
  const HoroscopeCardButton({super.key, required this.horoscope});

  @override
  Widget build(BuildContext contex) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            side: BorderSide(color: Colors.white, width: 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(horoscope.asset,
                        )),
                Text(
                  horoscope.name.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "(" + horoscope.dateRange.toUpperCase() + ")",
                  style: TextStyle(
                      color: Colors.white30,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ],
            ),
          ),
        ));
  }
}
