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
  List cropList = List();
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
    List cropItems = new List();
    if (this.dataAvailable) {
      cropItems = this.cropList;
    }
    var listview = ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: cropItems.length,
        // itemCount: 4,
        itemBuilder: (BuildContext context, int index) => Card(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              // child: this.dataAvailable
              //     ? FeedItemCard(feedItems[index])
              //     : Container(width: 325, height: 200, child: Center(child: CircularProgressIndicator())),
              child: CropFeedCard(
                  new CropData(cropItems[index]['id'].toString(), cropItems[index]['name'], cropItems[index]['species'], cropItems[index]['desc'],)),
            ));
    return Expanded(
      child: listview,
    );
  }

  _getData() async {
    print('in get data');
    var response = await httpClient.get("/list");
    print('after get');
    var jsonMap = jsonDecode(utf8.decode(response.bodyBytes));
    print('Response: ${response.statusCode}');
    print('Map: $jsonMap');
    // var flag=1;
    List cropList = [];
    for(var i=0; i<jsonMap.length; i++){
      print('i: $i');
      if(jsonMap[i].containsKey('id') && jsonMap[i].containsKey('name') && jsonMap[i].containsKey('desc') && jsonMap[i].containsKey('species')){
        print('val: $jsonMap[i]');
        cropList.add(jsonMap[i]);
      }
    }
    print('CropList: $cropList');
    return cropList;
  }
}
