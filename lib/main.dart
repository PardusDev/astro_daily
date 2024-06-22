import 'package:astro_daily/screens/home_screen.dart';
import 'package:astro_daily/screens/horoscope_interpretation_screen.dart';
import 'package:astro_daily/screens/splash_screen.dart';
import 'package:astro_daily/screens/tag_detail_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/HomePage': (context) => HomePage(),
        '/HoroscopeInterpretation': (context) => HoroscopeInterpretationPage(),
        '/TagDetail': (context) => TagDetailScreen(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

