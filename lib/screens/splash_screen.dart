import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // I created an artifical waiting time
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(
          context,
          '/HomePage'
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24,23,39, 1.0),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/splashScreenImage.png", color: Colors.white70, width: 320,),
              SizedBox(height: 24,),
              Text("ASTRO", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w300, fontSize: 42, letterSpacing: 12),)
            ],
          ),
        ),
      ),
    );
  }
}
