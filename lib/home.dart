import 'package:flora_ai/startup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).primaryColor,
      title: Row(children: <Widget>[
        Text('flora', 
              style: TextStyle(fontFamily: 'Less Sans', fontSize: 20, color: Theme.of(context).accentColor)),
            Text('.ai', style: TextStyle(fontFamily: 'Less Sans', fontSize: 20, color: Color(0xFFD3CEBA)
          )),
      ],),),
      body: Center(child:
      Column(children: <Widget>[
        Padding(padding: EdgeInsets.only(bottom: 20)),
        Image.asset('images/app icon.png', width: 200, height: 200),
        Padding(padding: EdgeInsets.only(bottom: 10)),
        Padding(padding: EdgeInsets.only(bottom: 20)),
        RaisedButton(color: Theme.of(context).accentColor,
        textColor: Theme.of(context).scaffoldBackgroundColor,
        child: Text('CLICK FROM CAMERA', style: TextStyle(fontFamily: 'Roboto', fontSize: 12),),
        // shape: ShapeBorder(RoundedRectangleBorder()),
        onPressed: (){
          print('Pressed');
        },
      ),
      Padding(padding: EdgeInsets.only(bottom: 10)),
        RaisedButton(color: Theme.of(context).accentColor,
        textColor: Theme.of(context).scaffoldBackgroundColor,
        child: Text('IMPORT FROM GALLERY', style: TextStyle(fontFamily: 'Roboto', fontSize: 12),),
        onPressed: (){
          print('Pressed');
        },
      )]),
    ));
  }
    
}