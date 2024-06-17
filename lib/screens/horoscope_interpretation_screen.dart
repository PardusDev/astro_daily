import 'package:flutter/material.dart';

class HoroscopeInterpretationPage extends StatelessWidget {
  const HoroscopeInterpretationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("f", style: TextStyle(fontFamily: 'GeZodiac', fontSize: 22, color: Colors.white70),),
                          SizedBox(width: 6,),
                          Text("Scorpio", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.white70),)
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
                      TodayTab(),
                      TomorrowTab(),
                      WeeklyTab(),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TodayTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: RichText(
          text: TextSpan(text: "Apr 24, 2020", style: TextStyle(fontSize: 16, color: Colors.white), children: const <TextSpan>[
            TextSpan(text: " - ", style: TextStyle(fontSize: 16, color: Colors.white60)),
            TextSpan(text: "Things aren't always as they first appear. People you thought you knew well and circumstances that you thought you understood thoroughly now seem anything but straightforward. Has the world really changed that much or has your perception altered somehow? It's time to direct this “altered” vision inward. You're ready for a change, Scorpio. Perhaps it's time to dust off that resume.", style: TextStyle(fontSize: 16, color: Colors.white60))
          ])
        ),
      ),
    );
  }
}

class TomorrowTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: RichText(
            text: TextSpan(text: "Apr 25, 2020", style: TextStyle(fontSize: 16, color: Colors.white), children: const <TextSpan>[
              TextSpan(text: " - ", style: TextStyle(fontSize: 16, color: Colors.white60)),
              TextSpan(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tempus eu purus sit amet sodales. Aliquam non molestie purus. Praesent vel vestibulum nunc, ut euismod nisi. Etiam lobortis nec mauris in consequat. Integer facilisis sollicitudin dolor sed efficitur. Etiam ut justo ac nulla aliquam pharetra. Phasellus varius venenatis ex eget cursus. Cras dictum sapien id massa condimentum convallis. Vestibulum ornare augue ac molestie tristique. Praesent in ex orci.", style: TextStyle(fontSize: 16, color: Colors.white60))
            ])
        ),
      ),
    );
  }
}

class WeeklyTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: RichText(
            text: TextSpan(text: "Apr 19-25, 2020", style: TextStyle(fontSize: 16, color: Colors.white), children: const <TextSpan>[
              TextSpan(text: " - ", style: TextStyle(fontSize: 16, color: Colors.white60)),
              TextSpan(text: "Mauris tempus urna at rutrum ornare. Sed non neque scelerisque, rutrum lorem convallis, mattis libero. Pellentesque lobortis in arcu dictum elementum. Proin pretium euismod nisi et fringilla. Fusce ac ligula elit. Nunc tincidunt ultrices nisi eget ullamcorper. Vestibulum eu mauris a ipsum gravida pretium. In hac habitasse platea dictumst. Aenean id mollis neque.", style: TextStyle(fontSize: 16, color: Colors.white60))
            ])
        ),
      ),
    );
  }
}

