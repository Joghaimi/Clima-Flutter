import 'package:geolocator/geolocator.dart';
class Location{
  var altitude;
  var longitude;
  Future<void> getLocation() async{ // you must ask for permition by put <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" /> in manfist file android/app/src/main also for ios their are application for it
    try{
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      altitude  = position.altitude;
      longitude = position.longitude;
    }catch(e){
       print(e);
    }
  }


}
