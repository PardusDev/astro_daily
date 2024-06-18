import 'package:flutter/material.dart';
import 'package:astro_daily/widgets/HoroscopesCard.dart';

import '../models/Horoscope.dart';
import '../services/APIService.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    APIService apiService = new APIService(apiUrl: "http://10.0.2.2:3000");
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
                FutureBuilder<List<Horoscope>>(
                    future: apiService.getHoroscopes(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        print("test0");
                      return Expanded(child: ListView.separated(
                          itemBuilder: (context, index) => HoroscopeCardSkelton(),
                        separatorBuilder: (context, index) => const SizedBox(height: 16),
                        itemCount: 6,
                      )
                      );
                      } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No data available'));
                      } else {
                        print("test1");
                        List<Horoscope> horoscopes = snapshot.data!;
                        print("test2");
                        return HoroscopesCard(horoscopes: horoscopes);
                      }
                    }
                ),
                SizedBox(height: 30,)
              ],
            ),
          ),
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
          Container(width: 80, height: 80, padding: EdgeInsets.all(24), decoration: BoxDecoration(color: Colors.white.withOpacity(0.04), borderRadius: BorderRadius.all(Radius.circular(16))),),
          SizedBox(height: 10,),
          Container(width: 80, height: 20, padding: EdgeInsets.all(24), decoration: BoxDecoration(color: Colors.white.withOpacity(0.04), borderRadius: BorderRadius.all(Radius.circular(16))),),
          SizedBox(height: 18,),
          Container(width: 100, height: 16, padding: EdgeInsets.all(24), decoration: BoxDecoration(color: Colors.white.withOpacity(0.04), borderRadius: BorderRadius.all(Radius.circular(16))),)
        ],
      ),
    );
  }
}

class HoroscopeCardSkelton extends StatelessWidget {
  const HoroscopeCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build (BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Skelton(
            height: 180,
            width: 160,
          ),
          SizedBox(width: 20,),
          Skelton(
            height: 180,
            width: 160,
          ),
        ],
      ),
    );
  }
}

// **#** END of THE SKELTON SECTION **#**
