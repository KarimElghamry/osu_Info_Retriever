import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'homescreen.dart';


void main()
{
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    )
  );
}
