import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Prayer extends StatefulWidget {
  @override
  _PrayerState createState() => _PrayerState();
}

class _PrayerState extends State<Prayer> {
  double LATITUDE, LONGTUDE;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    LATITUDE=position.latitude; LONGTUDE=position.longitude;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          children: [
                Text(LATITUDE.toString()+"\n"+LONGTUDE.toString(), style: TextStyle(fontSize: 32),),
            SpinKitFadingGrid
              (
              itemBuilder: (_, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? Colors.black : Colors.white,
                  ),
                );
              },
            ),
            FlatButton(onPressed: (){
              setState(() {
                getLocation();
              });
            }, child: Text("pres me"))
          ],
        ),
      ),
    );
  }
}

