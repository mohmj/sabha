import 'package:flutter/material.dart';
import 'HomePage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(

        backgroundColor: Colors.blue,
        appBar: AppBar(title: Text("سبحة", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black54,
        ),
        body: HomePage()
      ),
    );
  }
}
