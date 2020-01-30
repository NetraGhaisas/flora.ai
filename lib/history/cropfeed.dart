import 'dart:convert';

import 'package:flora_ai/http/Config.dart';
import 'package:flutter/material.dart';
import 'package:flora_ai/http/http-client.dart';
import 'package:http/http.dart' as http;
import 'cropdata.dart';
import 'cropfeedcard.dart';

class CropFeed extends StatefulWidget {
  @override
  _CropFeedState createState() => _CropFeedState(new HttpClient(AppConfig.baseUrl));
}

class _CropFeedState extends State<CropFeed> {
  bool dataAvailable = false;
  List<CropData> cropList = List();
  var cropItems;
  var httpClient;

  _CropFeedState(this.httpClient) {
    cropItems = _getData();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cropItems.then((value) {
      cropList = value;
      setState(() {
        dataAvailable = true;
      });
    });
  }

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

  _getData() async {
    //print('id: ${id}');
    var response = await httpClient.get("/list");
    Map jsonMap = jsonDecode(utf8.decode(response.bodyBytes));
    //print('Response: ${response.statusCode}');
    //print('Map: $jsonMap');
    return jsonMap["list"];
  }
}
