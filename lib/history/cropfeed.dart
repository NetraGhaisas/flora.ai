import 'package:flutter/material.dart';

import 'cropdata.dart';
import 'cropfeedcard.dart';

class CropFeed extends StatefulWidget {
  @override
  _CropFeedState createState() => _CropFeedState();
}

class _CropFeedState extends State<CropFeed> {
  @override
  Widget build(BuildContext context) {
    var listview = ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        // itemCount: feedItems.length,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) => Card(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              // child: this.dataAvailable
              //     ? FeedItemCard(feedItems[index])
              //     : Container(width: 325, height: 200, child: Center(child: CircularProgressIndicator())),
              child: CropFeedCard(
                  new CropData('Wheat', 'Triticum', 'Wheat is a cereal grain', 0)),
            ));
    return Expanded(
      child: listview,
    );
  }
}
