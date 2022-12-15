import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async{
    Response response = await get(Uri.https('worldtimeapi.org','api/timezone/Asia/Kolkata'));
    Map data = jsonDecode(response.body);
    String datetime = data['datetime'];
    String offset = data['utc_offset'];
     DateTime now  = DateTime.parse(datetime);
     print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loading screen'),
    );
  }
}
