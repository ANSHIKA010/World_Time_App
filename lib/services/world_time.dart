import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  late String location; // location name for the UI
  late String time; // the time in that location
  late String flag; //url to an asset flag icon
  late String url; // location url for api endpoint

  WorldTime({ required this.location, required this.flag ,required this.url});
  Future<void> getTime() async{
  try{
    Response response = await get(Uri.https('worldtimeapi.org','api/timezone/$url'));
    Map data = jsonDecode(response.body);
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    DateTime now  = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    time = now.toString();
  }
  catch(e) {
   print('caught error : $e');
   time = 'could not get time data';
  }

  }
}




