import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:splashscreen/splashscreen.dart';
import 'home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SplashScreen(
        loadingText: Text("Loading"),
        seconds: 3,
        photoSize: 150,
        image: Image.asset("assets/fnk.png"),
        title: Text("Get Supper Restaurant", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        navigateAfterSeconds: Home()
      ),
    );
  }
}