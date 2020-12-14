import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Free_thikr extends StatefulWidget {
  @override
  _Free_thikrState createState() => _Free_thikrState();
}

class _Free_thikrState extends State<Free_thikr> {

  int thikr=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(title: Text("FREE THKIR", style: TextStyle(color: Colors.white),),),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            child: ToggleSwitch(
              initialLabelIndex: 1,
              activeBgColor: Colors.black,
              inactiveBgColor: Colors.white,
              inactiveFgColor: Colors.black,
              labels: ['المقيد', 'الحر'],
              onToggle: (index) {
                print('switched to: $index');
              },
            ),
          ),
          Expanded(child: Center(child: Text(thikr.toString(), style: TextStyle(color: Colors.black, fontSize: 48),),)),
          Container(
            height: 80,
            width: double.infinity,
//            color: Colors.red,
            child: FloatingActionButton(
              child: Icon(Icons.add, color: Colors.black,),
              onPressed: (){
                setState(() {
                  thikr++;
                });
              },
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

class NotFreeThikr extends StatefulWidget {
  @override
  _NotFreeThikrState createState() => _NotFreeThikrState();
}

class _NotFreeThikrState extends State<NotFreeThikr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

