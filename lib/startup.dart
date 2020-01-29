import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

class StartupPage extends StatefulWidget {
  @override
  _StartupPageState createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  final List<Tab> tab = <Tab>[
    Tab(
      text: 'HISTORY',
    ),
    Tab(
      text: 'CLICK',
    ),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
     _tabController = TabController(vsync: this, length: 2, initialIndex: 1);
  } 

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var screenHeight = size.height;
    var screenWidth = size.width;
    return Scaffold(
      appBar: _getAppBar(),
      body: SizedBox(
          height: screenHeight,
          child: DefaultTabController(
            length: tab.length,
            initialIndex: 1,
            child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(100),
                  child: new SafeArea(
                      child: Container(
                    // color: Theme.of(context).primaryColor,
                    child: Column(
                      children: <Widget>[
                        new TabBar(
                            tabs: tab,
                            unselectedLabelColor:
                                Theme.of(context).primaryColor,
                            dragStartBehavior: DragStartBehavior.down,
                            labelPadding: EdgeInsets.symmetric(vertical: 5),
                            labelColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicator: new BubbleTabIndicator(
                              indicatorHeight: 25.0,
                              padding: EdgeInsets.symmetric(horizontal: 0),
                              indicatorColor: Theme.of(context).accentColor,
                              tabBarIndicatorSize: TabBarIndicatorSize.tab,
                            ))
                      ],
                    ),
                  )),
                ),
                // appBar: AppBar(bottom: TabBar(tabs:tab,),title: Text('flora test',style:TextStyle(color:Colors.black)),),
                body: TabBarView(
                  children: [
                    Text('hello',style:TextStyle(color:Colors.black)),
                    // Icon(Icons.directions_car,color:Colors.black),
                    Icon(Icons.directions_transit),
                  ],
                )),
          )),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Row(
        children: [
          Image.asset('images/app icon.png'),
          Padding(padding: EdgeInsets.only(right: 10)),
          Text('flora', 
          style: TextStyle(fontFamily: 'Less Sans', fontSize: 20, color: Theme.of(context).accentColor)),
          Text('.ai', 
          style: TextStyle(fontFamily: 'Less Sans', fontSize: 20, color: Color(0xFFD3CEBA)
          )
      )]),
    );
  }
}

Container _getHistory(BuildContext context) {
  // Widget history = Container(
  //   child:Text('Hello', style: TextStyle(color: Colors.black)),
  // );
  
  Size size = MediaQuery.of(context).size;
    var screenHeight = size.height;
    var screenWidth = size.width;
  Widget history = new Container(
    height: 350,
    width: screenWidth,
    color: Theme.of(context).accentColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Text('HISTORY',
              style: TextStyle(color: Theme.of(context).accentColor)),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Text("hello",
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.black, fontSize: 14)),
        ),
      ],
    ),
  );
  return history;
}

Container _getClick(BuildContext context) {
  Widget click = Container(
    child: Text('Click!'),
  );
  return click;
}
