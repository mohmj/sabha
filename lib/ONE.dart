import 'package:flutter/material.dart';
import 'package:sabha/HomePage.dart';
import 'Free_thikr.dart';
import 'Prayer.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ONE extends StatefulWidget {
  @override
  _ONEState createState() => _ONEState();
}

class _ONEState extends State<ONE> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Padding(
          padding: EdgeInsets.all(15),
          child: FlatButton(
            child: Container(
              decoration: BoxDecoration( border: Border.all(color: Colors.red, width: 4),borderRadius: BorderRadius.all(Radius.circular(12))),
            ),
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=> HomePage()));
            },
          ),
        ),),
        Expanded(child: Padding(
          padding: EdgeInsets.fromLTRB(15,0,15,0),
          child: FlatButton(
            onPressed: () {
              setState(()  {
              Navigator.push(context,MaterialPageRoute(builder: (context)=> Prayer()));
              });
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
    );
  }
}
