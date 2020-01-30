import 'package:flora_ai/startup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  @override
  static final routeName = '/home';
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _getAppBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // _getCropPicture(),
            SizedBox(
              width: 170,
              height: 160,
              child: Text('Welcome to flora.ai.\n\nMake sure that the picture is taken in adequate light and the crop is in focus. \n\nEnsure that the leaves/flowers are highighted in your picture',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.orange,
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal,
                      fontSize: 16)),
            ),
            SizedBox(
              height: 10,
            ),
            // _getCropInfo(context),
            Padding(padding: EdgeInsets.only(bottom: 30)),
            Image.asset(
              'images/app icon.png',
              height: 150,
            ),
            Padding(padding: EdgeInsets.only(bottom: 30)),
            OutlineButton(
              child: Text('OK', style: TextStyle(fontSize: 20)),
              splashColor: Theme.of(context).accentColor,
              highlightedBorderColor: Theme.of(context).accentColor,
              onPressed: () {
                // pickImageFromGallery(ImageSource.gallery);
                Navigator.of(context).pushNamed('/startup');
              },
            ),
          ],
        ),
      ),
    );
  }
}
