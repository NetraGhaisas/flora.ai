import 'package:flora_ai/startup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flora_ai/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final routes = <String, WidgetBuilder>{
    StartupPage.routeName: (context) => Scaffold(body:SafeArea(child: StartupPage(),)),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      home: StartupPage(),
      theme: _appTheme,
      routes: routes,
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
        fontStyle: FontStyle.normal,
        fontSize: 14),
        body2: TextStyle(fontFamily: 'Roboto',
        fontStyle: FontStyle.italic,
        fontSize: 14),
    )
  );
}