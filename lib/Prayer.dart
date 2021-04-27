import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Prayer extends StatefulWidget {

  @override
  _PrayerState createState() => _PrayerState();
}

String LATITUDE = "", LONGTUDE = "";

class _PrayerState extends State<Prayer> {

  bool visLocation=false;
  
  @override
  void initState() {
    getLocation();
    super.initState();
  }

  void getLocation() async {
    setState(() {
      LATITUDE=LONGTUDE="";
    });
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
        setState(() {
          LATITUDE = "${position.latitude}";
          LONGTUDE = "${position.longitude}";
          visLocation=true;
        });
    print("Latitude: " + LATITUDE + "\nLongtude: " + LONGTUDE);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Visibility(
                visible: !visLocation,
                child: SpinKitRing(
                color: Colors.red[900],
                  size: 50,
              ),),
              Text(LATITUDE),
              Text(LONGTUDE),
              Expanded(
                child: Center(
                  child: Text("صبحي موسى كاظم النملي", style: TextStyle(color: Colors.red, fontSize: 36),),
                ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      getLocation();
                    });
                  },
                  icon: Icon(Icons.notes))
            ],
          ),
        ),
      ),
    );
  }
}
