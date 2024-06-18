import 'package:flutter/material.dart';
import 'package:astro_daily/widgets/HoroscopesCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24,23,39, 1.0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 8.0, right: 8.0),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: <Widget>[
                Center(
                  child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      double imageWidth = constraints.maxWidth * 0.35;
                      return Image.asset("assets/images/astrology_header.png", width: imageWidth, fit: BoxFit.cover);
                    },
                  ),
                ),
                SizedBox(height: 20,),
                HoroscopesCard(horoscopes: ,),
                SizedBox(height: 30,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
