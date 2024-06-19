import 'package:astro_daily/services/APIService.dart';
import 'package:flutter/material.dart';

import '../models/Horoscope.dart';
import '../models/Tag.dart';
import '../models/TagDetails.dart';

class TagDetailScreen extends StatelessWidget {
  const TagDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Horoscope existingHoroscope = args['existingHoroscope'];
    final Tag existingTag = args['existingTag'];
    APIService apiService = new APIService(apiUrl: "http://10.0.2.2:3000");

    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 23, 39, 1.0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 8.0, right: 4.0),
          child: FutureBuilder <TagDetails>(
            future: apiService.getTagDetail(existingHoroscope, existingTag),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.hasError ||
              !snapshot.hasData ||
              (snapshot.data is List && (snapshot.data as List).isEmpty)) {
                return Skelton();
              } else {
                TagDetails tagDetails = snapshot.data!;
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Image.asset(existingTag.assetPath, color: Colors.white, width: 80,),
                        SizedBox(height: 20,),
                        Text("The horoscope of ${existingHoroscope.name} about ${existingTag.name}",
                            textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Container(
                              width: 420,
                              height: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.04),
                              ),
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    tagDetails.comment,
                                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            }
          ),
        ),
      ),
    );
  }
}

class Skelton extends StatelessWidget {
  const Skelton({
    Key? key,
  }) : super(key: key);


  @override
  Widget build (BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.04),
          borderRadius: const BorderRadius.all(Radius.circular(16))
      ),
      child: Column(
        children: [
          SizedBox(height: 12,),
          Container(width: 140, height: 140, padding: EdgeInsets.all(24), decoration: BoxDecoration(color: Colors.white.withOpacity(0.04), borderRadius: BorderRadius.all(Radius.circular(16))),),
          SizedBox(height: 25,),
          Container(width: 260, height: 22, padding: EdgeInsets.all(24), decoration: BoxDecoration(color: Colors.white.withOpacity(0.04), borderRadius: BorderRadius.all(Radius.circular(16))),),
          SizedBox(height: 30,),
          Container(width: 360, height: 360, padding: EdgeInsets.all(24), decoration: BoxDecoration(color: Colors.white.withOpacity(0.04), borderRadius: BorderRadius.all(Radius.circular(16))),),
        ],
      ),
    );
  }
}
