import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location; // location name for the UI
  late String time; // the time in that location
  late String flag; //url to an asset flag icon
  late String url; // location url for api endpoint
  late bool isDaytime; // true or false if daytime or not

  WorldTime({ required this.location, required this.flag ,required this.url});
  Future<void> getTime() async{
  try{
    Response response = await get(Uri.https('worldtimeapi.org','api/timezone/$url'));
    Map data = jsonDecode(response.body);
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    String offsetMin = data['utc_offset'].substring(4, 6);
    DateTime now  = DateTime.parse(datetime);
    if(data['utc_offset'].substring(0,1) == '+'){
      now = now.add(Duration(hours: int.parse(offset), minutes: int.parse(offsetMin)));
    }
    else{
      now = now.subtract(Duration(hours: int.parse(offset), minutes: int.parse(offsetMin)));
    }

    isDaytime = now.hour>6 && now.hour<20 ? true : false;
    time = DateFormat.jm().format(now);
  }
  catch(e) {
   print('caught error : $e');
   time = 'could not get time data';
  }

  }
}




