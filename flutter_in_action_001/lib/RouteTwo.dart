import 'package:flutter/material.dart';

class RouteTwo extends StatelessWidget {
  RouteTwo({Key key, @required this.text}) : super(key: key);
  final String text; // text为其他路由传递过来的参数，显示在页面上

  @override
  Widget build(BuildContext context) {
    // var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton( // 重写顶部返回按钮响应事件
          onPressed: () => Navigator.of(context).pop('Route two点击顶部返回按钮返回值'),
        ),
        title: Text('Two'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
            child: Column(
          children: <Widget>[
            Text(text),
            RaisedButton(
              onPressed: () => Navigator.of(context).pop('Route two点击按钮返回值'),
              child: Text('返回'),
            )
          ],
        )),
      ),
    );
  }
}
