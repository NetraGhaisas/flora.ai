import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flora_ai/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: _appTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}

final ThemeData _appTheme = _getAppTheme();

ThemeData _getAppTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: const Color(0xFFF2EEDF),
    accentColor: const Color(0xFF354F5B),
    scaffoldBackgroundColor: Colors.white,

    textTheme: TextTheme(
      body1: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14)
    )
  );
}