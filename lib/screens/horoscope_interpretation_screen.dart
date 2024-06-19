import 'package:astro_daily/services/APIService.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/Horoscope.dart';
import '../models/HoroscopeDetails.dart';
import '../models/Tag.dart';
import '../widgets/HoroscopeTag.dart';
import '../widgets/HoroscopeTagButton.dart';

class HoroscopeInterpretationPage extends StatefulWidget {
  const HoroscopeInterpretationPage({super.key});

  @override
  State<HoroscopeInterpretationPage> createState() => _HoroscopeInterpretationPage();
}

class _HoroscopeInterpretationPage extends State<HoroscopeInterpretationPage> {
  @override
  void initState() {
    super.initState();
  }

  int _currentIndex = 0;

  void onTabTapped(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Horoscope args = ModalRoute.of(context)!.settings.arguments as Horoscope;
    APIService apiService = new APIService(apiUrl: "http://10.0.2.2:3000");

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(24, 23, 39, 1.0),
        body: _currentIndex == 0 ? InterpretationScreen(apiService: apiService, horoscope: args,) : TagScreen(horoscope: args, apiService: apiService,),
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent
          ),
          child: BottomNavigationBar(
            backgroundColor: Color.fromRGBO(24, 23, 39, 1.0),
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white54,

            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.comment_outlined,),
                label: "Interpretation",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.tag,),
                  label: "Tags"
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InterpretationScreen extends StatelessWidget {
  final APIService apiService;
  final Horoscope horoscope;
  const InterpretationScreen({super.key, required this.apiService, required this.horoscope});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 28.0, left: 4.0, right: 4.0),
        child: FutureBuilder <HoroscopeDetails>(
            future: apiService.getHoroscopeDetails(horoscope),
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
                            double imageWidth = constraints.maxWidth * 0.6;
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
                              Text(horoscope.symbolChar, style: TextStyle(fontFamily: 'GeZodiac', fontSize: 22, color: Colors.white70),),
                              SizedBox(width: 6,),
                              Text(horoscope.name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.white70),)
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



// TagScreen Section

class TagScreen extends StatelessWidget {
  final Horoscope horoscope;
  final APIService apiService;
  const TagScreen({super.key, required this.horoscope, required this.apiService});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 28.0, left: 4.0, right: 4.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(horoscope.symbolChar, style: TextStyle(fontFamily: 'GeZodiac', fontSize: 24, color: Colors.white),),
                SizedBox(width: 9,),
                Text(horoscope.name, style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, color: Colors.white),)
              ],
            ),
            SizedBox(height: 12,),
            FutureBuilder(
                future: apiService.getTags(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      snapshot.hasError ||
                      !snapshot.hasData ||
                      (snapshot.data is List && (snapshot.data as List).isEmpty)) {
                    return Container(
                      width: 340,
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => TagSkelton(width: 340, height: 80,),
                        separatorBuilder: (context, index) => const SizedBox(height: 12,),
                        itemCount: 6,
                      ),
                    );
                  } else {
                    List<Tag> tags = snapshot.data!;
                    return HoroscopeTag(selectedHoroscope: horoscope, tags: tags,);
                  }
                }
            )
          ],
        ),
      ),
    );
  }
}

class TagSkelton extends StatelessWidget {
  const TagSkelton({
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
      child: Row(
        children: [
          Container(width: 80, height: 60, padding: EdgeInsets.all(24), decoration: BoxDecoration(color: Colors.white.withOpacity(0.04), borderRadius: BorderRadius.all(Radius.circular(16))),),
          SizedBox(width: 12,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(width: 60, height: 16, padding: EdgeInsets.all(24), decoration: BoxDecoration(color: Colors.white.withOpacity(0.04), borderRadius: BorderRadius.all(Radius.circular(16))),),
              Container(width: 160, height: 16, padding: EdgeInsets.all(24), decoration: BoxDecoration(color: Colors.white.withOpacity(0.04), borderRadius: BorderRadius.all(Radius.circular(16))),),
            ],
          )
        ],
      ),
    );
  }
}



