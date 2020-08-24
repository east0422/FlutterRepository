import 'package:flutter/material.dart';
import 'package:flutter_in_action_001/Routes.dart' show singleChildScrollViewWidget, listViewWidget, gridViewWidget, customScrollViewWidget, scrollControllerWidget;

class ScrollableWidgets extends StatelessWidget {
  final List<Map> list = [
    {'title': 'SingleChildScrollView', 'routeName': singleChildScrollViewWidget},
    {'title': 'ListView', 'routeName': listViewWidget},
    {'title': 'GridView', 'routeName': gridViewWidget},
    {'title': 'CustomScrollView', 'routeName': customScrollViewWidget},
    {'title': '滚动监听及控制(ScrollController)', 'routeName': scrollControllerWidget},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('可滚动组件'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: list.map((dic) => FlatButton(
            child: Text(dic['title']),
            color: Colors.blue,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              Navigator.pushNamed(context, dic['routeName']);
            },
          )).toList(),
        ),
      ),
    );
  }
}