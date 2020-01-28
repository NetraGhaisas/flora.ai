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
  final List<Tab> tab = <Tab> [
    Tab(text: 'HISTORY',),
    Tab(text: 'CLICK',),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: SizedBox(
        height: 60,
      child: DefaultTabController(
          length: tab.length,
          initialIndex: 1,
          child: Scaffold(
            appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: new SafeArea(child: Container(
              // color: Theme.of(context).primaryColor,
              child: Column(children: <Widget>[
                new TabBar(tabs: tab,
                unselectedLabelColor: Theme.of(context).primaryColor,
                dragStartBehavior: DragStartBehavior.down,
                labelPadding: EdgeInsets.symmetric(vertical: 5),
                labelColor: Theme.of(context).scaffoldBackgroundColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: new BubbleTabIndicator(
                indicatorHeight: 25.0,
                padding: EdgeInsets.symmetric(horizontal: 0),
                indicatorColor: Theme.of(context).accentColor,

                tabBarIndicatorSize: TabBarIndicatorSize.tab,
              ))],),
            )),
          )),
)
      ),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Row(
        children: [
          Image.asset('images/app icon.png'),
          Padding(padding: EdgeInsets.only(right: 10)),
          Text('flora.ai', 
          style: TextStyle(fontFamily: 'Less Sans', fontSize: 20, color: Theme.of(context).accentColor))]
          ),
    );
  }
}