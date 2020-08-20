import 'package:flutter/material.dart';

class FunctionalWidgets extends StatelessWidget {
  final List<Map> list = [
    // {'title': '', 'routeName': ''},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('功能型组件'),
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