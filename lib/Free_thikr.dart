import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Free_thikr extends StatefulWidget {
  @override
  _Free_thikrState createState() => _Free_thikrState();
}

class _Free_thikrState extends State<Free_thikr> {
  TextEditingController totalThikrController = TextEditingController();

  int thikr = 0;
  int getTotalThikr;
  int totalThikr = 0;
  int freeThikr = 0;
  bool vis = true;

  double progressFunction(sub,total){
    if(sub/total<=1){
      return (sub/total);
    }else if (sub/total>1){
      return 1;
    }else{
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // appBar: AppBar(
      //   title: Text(
      //     "FREE THKIR",
      //     style: TextStyle(color: Colors.white),
      //   ),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                child: FlutterToggleTab(
                  labels: ['المقيد', 'الحر'],
                  initialIndex: 1,
                  selectedBackgroundColors: [Colors.black],
                  unSelectedBackgroundColors: [Colors.white],
                  selectedTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                  unSelectedTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                  selectedLabelIndex: (index) {
                    setState(() {
                      if (index == 0) {
                        thikr = 0;
                        vis = false;
                        Alert(
                          context: context,
                          type: AlertType.none,
                          title: "أدخل هدفك",
                          content: Column(
                            children: [
                              TextField(
                                keyboardType: TextInputType.number,
                                controller: totalThikrController,
                              )
                            ],
                          ),
                          buttons: [
                            DialogButton(
                              child: Text(
                                "ابدأ",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () {
                                setState(() {
                                  totalThikr = int.parse(
                                      totalThikrController.text.toString());
                                  Navigator.of(context).pop();
                                });
                              },
                              width: 120,
                            ),
                          ],
                        ).show();
//
                      } else {
                        setState(() {
                          thikr = 0;
                          vis = true;
                        });
                      }
                    });
                  },
                ),
              ),
            ),
            Visibility(
              visible: vis,
              child: Expanded(
                child: Column(
                  children: [
                    Expanded(
                        child: Center(
                      child: Text(
                        thikr.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 48),
                      ),
                    )),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: !vis,
              child: Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: thikr.toString(),
                                style:
                                    TextStyle(color: Colors.black, fontSize: 48),
                              ),
                              TextSpan(
                                text: " / " + totalThikr.toString(),
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 38),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width - 50,
                        animation: false,
                        lineHeight: 20.0,
                        animationDuration: 1000,
                        percent: progressFunction(thikr, totalThikr),
                        // center: Text((thikr/totalThikr*100).toStringAsFixed(2) + "%", style: TextStyle(color: Colors.white),),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.green[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 80,
              width: double.infinity,
//            color: Colors.red,
              child: FloatingActionButton(
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    thikr++;
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
