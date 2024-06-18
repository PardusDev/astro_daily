import 'package:astro_daily/services/APIService.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/Horoscope.dart';
import '../models/HoroscopeDetails.dart';

class HoroscopeInterpretationPage extends StatelessWidget {
  const HoroscopeInterpretationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Horoscope args = ModalRoute.of(context)!.settings.arguments as Horoscope;
    APIService apiService = new APIService(apiUrl: "http://10.0.2.2:3000");

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(24, 23, 39, 1.0),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 28.0, left: 4.0, right: 4.0),
            child: FutureBuilder <HoroscopeDetails>(
              future: apiService.getHoroscopeDetails(args),
              builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      snapshot.hasError ||
                      !snapshot.hasData ||
                      (snapshot.data is List && (snapshot.data as List).isEmpty)) {
                    return Skelton();
                  } else {
                    HoroscopeDetails horoscopeDetails = snapshot.data!;
                    return Column(
                      children: [
                        Center(
                          child: LayoutBuilder(
                              builder: (BuildContext context, BoxConstraints constraints) {
                                double imageWidth = constraints.maxWidth * 0.8;
                                return Image.asset("assets/images/scorpio_interpretation.png", width: imageWidth, fit: BoxFit.cover,);
                              }
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(args.symbolChar, style: TextStyle(fontFamily: 'GeZodiac', fontSize: 22, color: Colors.white70),),
                                  SizedBox(width: 6,),
                                  Text(args.name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.white70),)
                                ],
                              ),
                              TabBar(
                                  labelColor: Colors.white70,
                                  indicatorColor: Colors.white70,
                                  dividerColor: Colors.transparent,
                                  splashFactory: NoSplash.splashFactory,
                                  overlayColor: WidgetStateProperty.resolveWith((states) => Colors.transparent),
                                  tabs: [
                                    Tab(text: "TODAY",),
                                    Tab(text: "TOMORROW",),
                                    Tab(text: "WEEKLY",)
                                  ]),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: TabBarView(
                            children: [
                              TodayTab(horoscopeDetails: horoscopeDetails),
                              TomorrowTab(horoscopeDetails: horoscopeDetails),
                              WeeklyTab(horoscopeDetails: horoscopeDetails),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                      ],
                    );
                  }
                }
              ),
            ),
          ),
        ),
      );
  }
}

class TodayTab extends StatelessWidget {
  final HoroscopeDetails horoscopeDetails;

  TodayTab({required this.horoscopeDetails});


  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('MMM dd, yyyy').format(DateTime.now());

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: RichText(
          text: TextSpan(text: formattedDate, style: TextStyle(fontSize: 16, color: Colors.white), children: <TextSpan>[
            TextSpan(text: " - ", style: TextStyle(fontSize: 16, color: Colors.white60)),
            TextSpan(text: horoscopeDetails.todayText, style: TextStyle(fontSize: 16, color: Colors.white60))
          ])
        ),
      ),
    );
  }
}

class TomorrowTab extends StatelessWidget {
  final HoroscopeDetails horoscopeDetails;

  TomorrowTab({required this.horoscopeDetails});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('MMM dd, yyyy').format(DateTime.now().add(Duration(days: 1)));
    
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: RichText(
            text: TextSpan(text: formattedDate, style: TextStyle(fontSize: 16, color: Colors.white), children: <TextSpan>[
              TextSpan(text: " - ", style: TextStyle(fontSize: 16, color: Colors.white60)),
              TextSpan(text: horoscopeDetails.tomorrowText, style: TextStyle(fontSize: 16, color: Colors.white60))
            ])
        ),
      ),
    );
  }
}

class WeeklyTab extends StatelessWidget {
  final HoroscopeDetails horoscopeDetails;

  WeeklyTab({required this.horoscopeDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: RichText(
            text: TextSpan(text: "This Week", style: TextStyle(fontSize: 16, color: Colors.white), children: <TextSpan>[
              TextSpan(text: " - ", style: TextStyle(fontSize: 16, color: Colors.white60)),
              TextSpan(text: horoscopeDetails.weeklyText, style: TextStyle(fontSize: 16, color: Colors.white60))
            ])
        ),
      ),
    );
  }
}

// **#** SECTION of SKELTON **#**

class Skelton extends StatelessWidget {
  const Skelton({
    Key? key, this.height, this.width,
  }) : super(key: key);

  final double? height, width;

  @override
  Widget build (BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.04),
          borderRadius: const BorderRadius.all(Radius.circular(16))
      ),
      child: Column(
        children: [
          SizedBox(height: 12,),
          Container(width: 360, height: 280, padding: EdgeInsets.all(24), decoration: BoxDecoration(color: Colors.white.withOpacity(0.04), borderRadius: BorderRadius.all(Radius.circular(16))),),
          SizedBox(height: 25,),
          Container(width: 120, height: 20, padding: EdgeInsets.all(24), decoration: BoxDecoration(color: Colors.white.withOpacity(0.04), borderRadius: BorderRadius.all(Radius.circular(16))),),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(width: 80, height: 20, padding: EdgeInsets.all(24), decoration: BoxDecoration(color: Colors.white.withOpacity(0.04), borderRadius: BorderRadius.all(Radius.circular(16))),),
              Container(width: 80, height: 20, padding: EdgeInsets.all(24), decoration: BoxDecoration(color: Colors.white.withOpacity(0.04), borderRadius: BorderRadius.all(Radius.circular(16))),),
              Container(width: 80, height: 20, padding: EdgeInsets.all(24), decoration: BoxDecoration(color: Colors.white.withOpacity(0.04), borderRadius: BorderRadius.all(Radius.circular(16))),),
            ],
          ),
          SizedBox(height: 18,),
          Container(width: 360, height: 220, padding: EdgeInsets.all(24), decoration: BoxDecoration(color: Colors.white.withOpacity(0.04), borderRadius: BorderRadius.all(Radius.circular(16))),),
        ],
      ),
    );
  }
}

// **#** END of SKELTON SECTION **#**



