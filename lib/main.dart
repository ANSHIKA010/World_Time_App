import 'package:flutter/material.dart';
import 'package:world_time/pages/choose.location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  debugShowCheckedModeBanner: false,
  routes: {
    '/':(context) => Loading(),
    '/home':(context) => Home(),
    '/location':(context)=> ChooseLocation(),
  },
));



