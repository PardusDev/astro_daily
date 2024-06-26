import 'package:flutter/material.dart';

import '../models/Horoscope.dart';
import '../models/Tag.dart';

class HoroscopeTagButton extends StatelessWidget {
  final Horoscope selectedHoroscope;
  final Tag tag;
  const HoroscopeTagButton({super.key, required this.selectedHoroscope, required this.tag});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/TagDetail', arguments: {'existingHoroscope': selectedHoroscope, 'existingTag': tag});
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          side: BorderSide(color: Colors.white, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
          )
        ),
        child: Row(
          children: [
            Image.asset(tag.assetPath, color: Colors.white, height: 40,),
            SizedBox(width: 20,),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tag.name, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),),
                  SizedBox(height: 1,),
                  Text(tag.description, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
