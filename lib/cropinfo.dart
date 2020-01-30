import 'package:flora_ai/history/cropdata.dart';
import 'package:flutter/material.dart';
import 'package:flora_ai/gallery.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flora_ai/home.dart';

class CropInfoPage extends StatelessWidget {
  final CropData crop;
  CropInfoPage(this.crop);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      appBar: _getAppBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _getCropPicture(),
            SizedBox(
              height: 10,
            ),
            _getCropInfo(context),
            Padding(padding: EdgeInsets.only(bottom: 30)),
            Image.asset(
              'images/app icon.png',
              height: 150,
            ),
          ],
        ),
      ),
    );
  }

  AppBar _getAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Row(children: [
        Image.asset('images/app icon.png'),
        Padding(padding: EdgeInsets.only(right: 10)),
        Text('flora',
            style: TextStyle(
                fontFamily: 'Less Sans',
                fontSize: 20,
                color: Theme.of(context).accentColor)),
        Text('.ai',
            style: TextStyle(
                fontFamily: 'Less Sans',
                fontSize: 20,
                color: Color(0xFFD3CEBA)))
      ]),
    );
  }


  _getCropPicture() {
    SizedBox box = SizedBox(
        height: 230,
        child: Container(
            decoration: BoxDecoration(
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    // image: AssetImage("../images/app icon.png"),
                    image: new NetworkImage(
                        "http://www.excelcropcare.com/images/homepage/overviewbg-res.jpg",
                        scale: 1)))));

    return box;
  }

  _getCropInfo(BuildContext context) {
    SizedBox box = SizedBox(
        width: 150,
        child: Container(
          child: Column(
            children: <Widget>[
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'CROP NAME',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  )),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(this.crop.name,
                      style: TextStyle(
                          color: Colors.black54, fontStyle: FontStyle.italic))),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'CROP SPECIES',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  )),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(this.crop.species,
                      style: TextStyle(
                          color: Colors.black54, fontStyle: FontStyle.italic))),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'CROP DESCRIPTION',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  )),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(this.crop.description,
                      style: TextStyle(
                          color: Colors.black54, fontStyle: FontStyle.italic))),
            ],
          ),
        ));
    // return box;
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: box,
    );
  }
}
