import 'package:flora_ai/gallery.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flora_ai/home.dart';

class ExportPage extends StatefulWidget {
  @override
  _ExportPageState createState() => _ExportPageState();
}

class _ExportPageState extends State<ExportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlineButton(
              child: Text('EXPORT', style: TextStyle(fontSize: 20)),
              splashColor: Theme.of(context).accentColor,
              highlightedBorderColor: Theme.of(context).accentColor,
              onPressed: () {
                
              },
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            Text('OR', style: TextStyle(color: Colors.grey,),),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            OutlineButton(
              child: Text('EMAIL', style: TextStyle(fontSize: 20)),
              splashColor: Theme.of(context).accentColor,
              highlightedBorderColor: Theme.of(context).accentColor,
              onPressed: () {
                
              },
            ),
            Padding(padding: EdgeInsets.only(bottom: 60)),
            Image.asset('images/app icon.png', height: 200,),
            // OutlineButton(
            //   child: Text('FIND CROP', style: TextStyle(fontSize: 20)),
            //   splashColor: Theme.of(context).accentColor,
            //   highlightedBorderColor: Theme.of(context).accentColor,
            //   onPressed: () {
            //     pickImageFromGallery(ImageSource.gallery);
            //   },
            // ),
            // RaisedButton(
            //   child: Text("IMPORT FROM GALLERY"),
            //   color: Theme.of(context).accentColor,
            //   textColor: Theme.of(context).scaffoldBackgroundColor,
            //   onPressed: () {
            //     pickImageFromGallery(ImageSource.gallery);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}