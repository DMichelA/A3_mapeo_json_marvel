import 'package:flutter/material.dart';
import 'package:jsonmapeoa3/main.dart';
import 'package:splashscreen/splashscreen.dart';


class ScreenSplash extends StatefulWidget {
  @override
  _myScreenSplash createState() => new _myScreenSplash();
}

class _myScreenSplash extends State<ScreenSplash> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SplashScreen(
        title: Text("Loading...",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.indigo),
        ),
        photoSize: 150,
        seconds: 5,
        backgroundColor: Colors.white,
        image: Image.network(
            'https://www.stickpng.com/assets/images/585f9357cb11b227491c3582.png'),
        navigateAfterSeconds: new homePage());
  }
}