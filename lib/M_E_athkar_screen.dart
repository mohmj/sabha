import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "Athkar.dart";
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MorningAndEveningAthkarScreen extends StatefulWidget {
  @override
  _MorningAndEveningAthkarScreenState createState() => _MorningAndEveningAthkarScreenState();
}
Athkar athkar = new Athkar();

class _MorningAndEveningAthkarScreenState extends State<MorningAndEveningAthkarScreen> {
  
  
  int numberOfThikrNow = 0; // عدد تسبيحات المستخدم لهذا الذكر
  int numberOfAllThikr=0; // العدد اللي سبح به المستخدم لجميع الأذكار
  int numberOfThikr=athkar.thikrNumber; // رقم الذكر الحالي في المصفوفة
  int len=athkar.getThikrLenght(); // طول مصفوفة الأذكار
  int totalThikr=athkar.getTotalThikrLoop(); // عدد الأذكار كاملة في الحصن.

  Color backgroundColor=Colors.blue;
  
  @override
  Widget build(BuildContext context) {
    
    int totalThisThikr=athkar.getThikrLoop(numberOfThikr); // عدد مرات تكرار الذكر من المصفوفة

    Alert endAlert=Alert(
      context: context,
      type: AlertType.success,
      title: "تم بحمد الله",
      buttons: [
        DialogButton(
          child: Text(
            "إنهاء",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: (){
            numberOfThikr=numberOfAllThikr=0;
            Navigator.pop(context);
          },
          width: 120,
        ),
      ],
    );
    
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    color: backgroundColor,
                    child: FlatButton(
//                    heroTag: "first",
//                  color: backgroundColor,
                      child: Icon(
                        Icons.arrow_back, color: Colors.white,
                      ),
                      onPressed: (){
                        setState(() {
//                      numberOfAllThikr-=numberOfThikrNow;
//                      if(numberOfThikrNow>0){
//                        numberOfAllThikr-=numberOfThikrNow;
//                      }else{
//                        numberOfAllThikr-=totalThisThikr;
//                      }

                          if(numberOfThikrNow>0 && numberOfAllThikr >= numberOfThikrNow){
                            numberOfAllThikr-=numberOfThikrNow;
                          }else if(numberOfThikrNow==0 && numberOfAllThikr>0 ){
                            if(totalThisThikr < numberOfAllThikr){
                              numberOfAllThikr-=totalThisThikr;
                            }else{
                              numberOfAllThikr=0;
                            }

                          }
                          numberOfThikrNow=0;
                          if(numberOfThikr>0){
                            athkar.backThikr();
                            numberOfThikr=athkar.thikrNumber;
                          }
                        });
                      },
                    ),
                  ),
                  Expanded(child: GestureDetector(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      color: Colors.blue,
                      child:
                      ListView(
                        children: [
                          Text(
                            athkar.getThikr(numberOfThikr) +
                                "\n\n\n\n-------------\n" +
                                athkar.getThikrSource(numberOfThikr),
//                  overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ),
                  Container(child: FlatButton(
//                heroTag: "second",
                    child: Icon(
                      Icons.arrow_forward, color: Colors.white,
                    ),
                    onPressed: (){
                      print("رقم الذكر الحالي في المصفوفة$numberOfThikr");
                      setState(() {
//                    numberOfAllThikr+=(totalThisThikr-numberOfThikrNow);
                        numberOfAllThikr=numberOfAllThikr-numberOfThikrNow+totalThisThikr;
                        numberOfThikrNow=0;
                        if(numberOfThikr<athkar.getThikrLenght()-1){
                          athkar.nextThekr();
                        }else{
                          athkar.resetThekr();
                          numberOfAllThikr=0;
                        }
                        numberOfThikr=athkar.thikrNumber;
                        if (numberOfThikr == 0) {
                          endAlert.show();
                        }
                      });
                    },
                  ),),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: false,
                lineHeight: 20.0,
                animationDuration: 1000,
                percent: (numberOfThikr+1)/len,
                center: Text((numberOfThikr+1).toString()+"/"+len.toString()),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.green,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: new LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: false,
                lineHeight: 20.0,
                animationDuration: 2000,
                percent: numberOfThikrNow/totalThisThikr,
                center: Text(numberOfThikrNow.toString()+" / "+totalThisThikr.toString()),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.red,
              ),
            ),
            // Container(
            //   child: Text(numberOfThikrNow.toString()+" / "+totalThisThikr.toString()),
            // ),
            Container(
                color: Colors.red,
                width: double.infinity,
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
//    Container(
//    child: Padding(
//      padding: const EdgeInsets.fromLTRB(0,0,0,0),
//      child: FloatingActionButton(
//
//      ),
//    ),),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,0,0),
                      child: FlatButton(
//                  heroTag: "third",
                        child: Icon(Icons.add, color: Colors.white, size: 50),
                        onPressed: () {
                          setState(() {
                            if(numberOfThikrNow<totalThisThikr){
                              numberOfThikrNow++;
                              numberOfAllThikr++;
                            }else{
                              numberOfThikrNow=0;
                              if(numberOfThikr<athkar.getThikrLenght()-1){
                                athkar.nextThekr();
                              }else{
                                athkar.resetThekr();
                              }
                              numberOfThikr=athkar.thikrNumber;
                              if (numberOfThikr == 0) {
                                numberOfAllThikr=0;
                                endAlert.show();
                              }
                            }
                          });
                        },
                      ),
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
