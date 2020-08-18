import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttercovid/ui/countries.dart';
import 'file:///D:/FlutterProjects/flutter_covid/lib/nav_bar/home_navigation_page.dart';
import 'package:fluttercovid/ui/worldTotal.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(backgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        backgroundColor: Colors.white70,
        seconds: 2,
        loaderColor: Colors.lightGreen,
        loadingText: Text('STAY HOME , STAY SAFE'),
        navigateAfterSeconds: HomePage(),
      ),
    );
  }
}


