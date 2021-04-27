import 'package:flutter/material.dart';
import 'package:sabha/M_E_athkar_screen.dart';
import 'package:sabha/info_screen.dart';
import 'Free_thikr.dart';
import 'Prayer.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class HomeScreen extends StatelessWidget {

  static const String id="home_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
            child: IconButton(
              icon: Icon(
                Icons.info_outline,
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoScreen()));
              },
            ),
          ),

        ],
        title: Text("Sabha", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black54,
      ),
      body: Column(
        children: [
          Expanded(child: Padding(
            padding: EdgeInsets.all(15),
            child: FlatButton(
              child: Container(
                decoration: BoxDecoration( border: Border.all(color: Colors.red, width: 4),borderRadius: BorderRadius.all(Radius.circular(12))),
              ),
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=> MorningAndEveningAthkarScreen()));
              },
            ),
          ),),
          Expanded(child: Padding(
            padding: EdgeInsets.fromLTRB(15,0,15,0),
            child: FlatButton(
              onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> Prayer()));
              },

              child: Container(
                decoration: BoxDecoration( border: Border.all(color: Colors.green, width: 4),borderRadius: BorderRadius.all(Radius.circular(12))),
              ),
            ),
          ),),
          Expanded(child: Padding(
            padding: EdgeInsets.all(15),
            child: FlatButton(
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=> Free_thikr()));
              },
              child: Container(
                decoration: BoxDecoration( border: Border.all(color: Colors.blue,width: 4),borderRadius: BorderRadius.all(Radius.circular(12))),
              ),
            ),
          ),),
        ],
      ),
    );
  }
}



