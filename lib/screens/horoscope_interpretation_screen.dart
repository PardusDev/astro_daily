import 'package:flutter/material.dart';

class HoroscopeInterpretationPage extends StatelessWidget {
  const HoroscopeInterpretationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 23, 39, 1.0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 28.0, left: 4.0, right: 4.0),
          child: Column(
            children: [
              Center(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double imageWidth = constraints.maxWidth * 0.8;
                    return Image.asset("assets/images/scorpio_interpretation.png", width: imageWidth, fit: BoxFit.cover,);
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
