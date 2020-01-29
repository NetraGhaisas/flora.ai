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

class _StartupPageState extends State<StartupPage> with SingleTickerProviderStateMixin{
  final List<Tab> tab = <Tab> [
    Tab(text: 'HISTORY',),
    Tab(text: 'CLICK',),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
     _tabController = TabController(vsync: this, length: 2, initialIndex: 1);
  } 

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
                controller: _tabController,
                unselectedLabelColor: Theme.of(context).primaryColor,
                dragStartBehavior: DragStartBehavior.down,
                labelPadding: EdgeInsets.symmetric(vertical: 5),
                labelColor: Theme.of(context).scaffoldBackgroundColor,
                // indicatorSize: TabBarIndicatorSize.tab,
                indicator: new BubbleTabIndicator(
                indicatorHeight: 25.0,
                padding: EdgeInsets.symmetric(horizontal: 0),
                indicatorColor: Theme.of(context).accentColor,
                // tabBarIndicatorSize: TabBarIndicatorSize.tab,
              ))],),
            )),
          ),
          body: TabBarView(children: <Widget>[
            Text('HISTORY'),
            Text('CLICK')],
            // controller: _tabController,
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
          Text('flora', 
          style: TextStyle(fontFamily: 'Less Sans', fontSize: 20, color: Theme.of(context).accentColor)),
          Text('.ai', 
          style: TextStyle(fontFamily: 'Less Sans', fontSize: 20, color: Color(0xFFD3CEBA)
          )
      )]),
    );
  }
}