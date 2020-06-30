import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
const APIKey ="528059356c03d1275260bb1338d02861";
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  var lat;
  var lenget;

  Future <dynamic> getcityWeather(String CityName) async{
   var url = '$openWeatherMapURL?q=$CityName&appid=$APIKey&units=metric';
   Networking networking = Networking(url);
   var weatherHelper = await networking.getdata();
   return weatherHelper;
  }





  Future <dynamic> getLocationWeather() async{
    Location location =Location();
    await location.getLocation();
    lat =location.altitude;
    lenget = location.longitude;
    Networking networking = Networking('$openWeatherMapURL?lat=$lat&lon=$lenget&appid=$APIKey&units=metric');
    var weatherHelper = await networking.getdata();
    return weatherHelper;
  }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
