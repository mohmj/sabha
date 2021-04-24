import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ONE.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
         Container(
           margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
           child: Icon(
             FontAwesomeIcons.bandAid
           ),
         ),

          ],
          title: Text("Sabha", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black54,
        ),
        body: ONE()
      ),
    );
  }
}
