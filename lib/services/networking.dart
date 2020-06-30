import 'package:http/http.dart' as http;
import 'dart:convert'; // # To help us to use json
class Networking{
  Networking(this.url);
  final url;
  Future getdata() async{
    http.Response response=await http.get(url);
    if(response.statusCode==200){
      String data = response.body;
      var DecodedData = jsonDecode(data);
      return DecodedData;
    }else{
      print("Some thing goes wrong");
    }
  }
}


