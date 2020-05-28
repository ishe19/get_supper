import 'package:flutter/material.dart';
import 'package:get_supper/ui/home.dart';
import 'package:get_supper/ui/utils/uidata.dart';
import 'ui/splash.dart';

void main() => runApp(GetSupper());

class GetSupper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Get Supper",
      debugShowCheckedModeBanner: false,
      home: Splash(),
      theme: ThemeData(
        primaryColor: Uidata.primaryColor,
        accentColor: Uidata.accentColor,
        scaffoldBackgroundColor: Colors.white
      ),
    );
  }
}