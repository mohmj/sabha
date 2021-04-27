import 'package:flutter/material.dart';
import 'package:sabha/info_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: HomeScreen(),
      initialRoute:HomeScreen.id ,
      routes: {
        // InfoScreen.id: (context)=>InfoScreen(),
        HomeScreen.id:(context)=>HomeScreen(),
      },
    );
  }
}