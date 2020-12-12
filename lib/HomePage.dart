import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "Athkar.dart";
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Athkar athkar = new Athkar();

class _HomePageState extends State<HomePage> {

  int numberOfThikrNow = 0; // عدد تسبيحات المستخدم لهذا الذكر
  int numberOfAllThikr=0; // العدد اللي سبح به المستخدم لجميع الأذكار
  int numberOfThikr=athkar.thikrNumber; // رقم الذكر الحالي في المصفوفة
  int len=athkar.athkarMorning.length; // طول مصفوفة الأذكار
  int totalThikr=athkar.totalThikrLoop(); // عدد الأذكار كاملة في الحصن.

  Color backgroundColor=Colors.blue;

  @override
  Widget build(BuildContext context) {

    int totalThisThikr=athkar.athkarMorning[numberOfThikr].loop; // عدد مرات تكرار الذكر من المصفوفة

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            children: [
              Container(
                color: backgroundColor,
                child: FloatingActionButton(
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
              Expanded(child: Container(
                margin: EdgeInsets.all(10),
                color: Colors.blue,
                child: Align(
                    alignment: Alignment.topRight,
                    child: Wrap(
                      children: [
                        Text(
                          athkar.getThikrMorning(numberOfThikr) +
                              "\n\n\n\n-------------\n" +
                              athkar.getThikrSourceMorning(numberOfThikr),
//                  overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    )),
              ),),
              Container(child: FloatingActionButton(
                child: Icon(
                  Icons.arrow_forward, color: Colors.white,
                ),
                onPressed: (){
                  setState(() {
//                    numberOfAllThikr+=(totalThisThikr-numberOfThikrNow);
                      numberOfAllThikr=numberOfAllThikr-numberOfThikrNow+totalThisThikr;
                    numberOfThikrNow=0;
                    if(numberOfThikr<athkar.athkarMorning.length-1){
                      athkar.nextThekr();
                    }else{
                      athkar.resetThekr();
                      numberOfAllThikr=0;
                    }
                    numberOfThikr=athkar.thikrNumber;
                    if (numberOfThikr == 0) {
                      Alert(
                        context: context,
                        type: AlertType.success,
                        title: "تم بحمد الله",
                        desc: "لا تنس صلاة الضحى",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "إنهاء",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: (){
                              numberOfThikr=0;
                              Navigator.pop(context);
                            },
                            width: 120,
                          ),
                          DialogButton(
                            child: Text(
                              "إنهاء",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: (){
                              numberOfThikr=0;
                              Navigator.pop(context);
                            },
                            width: 120,
                          )
                        ],
                      ).show();
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
            percent: numberOfAllThikr/totalThikr,
            center: Text((numberOfAllThikr/totalThikr*100).toStringAsFixed(2) + "%"),
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
            center: Text((numberOfThikrNow/totalThisThikr*100).toStringAsFixed(2)+"%"),
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.red,
          ),
        ),
        Container(
          child: Text(numberOfThikrNow.toString()+" / "+totalThisThikr.toString()),
        ),
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
                child: FloatingActionButton(
                  child: Icon(Icons.add, color: Colors.white, size: 50),
                  onPressed: () {
                    setState(() {
                      if(numberOfThikrNow<totalThisThikr){
                        numberOfThikrNow++;
                        numberOfAllThikr++;
                      }else{
                        numberOfThikrNow=0;
                        if(numberOfThikr<athkar.athkarMorning.length-1){
                          athkar.nextThekr();
                        }else{
                          athkar.resetThekr();
                        }
                        numberOfThikr=athkar.thikrNumber;
                        if (numberOfThikr == 0) {
                          Alert(
                            context: context,
                            type: AlertType.success,
                            title: "تم بحمد الله",
                            desc: "لا تنس صلاة الضحى",
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
                              DialogButton(
                                child: Text(
                                  "إنهاء",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                onPressed: (){
                                  numberOfThikr=0;
                                  Navigator.pop(context);
                                },
                                width: 120,
                              )
                            ],
                          ).show();
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
    );
  }
}
