import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() { // this function called when the wedget finish building
    // TODO: implement initState
    super.initState();
    getLocationandData();
    
  }
  void getLocationandData() async{
    WeatherModel weatherModel = await WeatherModel();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(weatherModel.getLocationWeather());
    }));

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SpinKitRotatingCircle(
          color :Colors.white,
          size: 100,
        ),

      ),
    );
  }
}
