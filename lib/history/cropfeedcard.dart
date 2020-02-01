import 'package:flutter/material.dart';

import 'cropdata.dart';

class CropFeedCard extends StatelessWidget {
  final CropData crop;

  CropFeedCard(this.crop);
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).primaryColor,
        elevation: 10.0,
        child: Container(
          height: 150,
          child: Align(
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                _getCropPicture(),
                SizedBox(
                  width: 10,
                ),
                _getCropInfo(context),
              ],
            ),
          ),
        ));
    //     child: Row(
    //   children: <Widget>[_getCropPicture(), _getCropInfo()],
    // ));
  }

  _getCropPicture() {
    SizedBox box = SizedBox(
        width: 150,
        child: Container(
            decoration: BoxDecoration(
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("images/app icon.png"),
                    // image: NetworkImage(
                    //     this.crop.imageUrl,)
                        ))));

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
