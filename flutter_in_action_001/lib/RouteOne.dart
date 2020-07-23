import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_in_action_001/RouteTwo.dart';

class RouteOne extends StatefulWidget {
  RouteOne({Key key}) : super(key: key);

  @override
  RouteOneState createState() {
    return RouteOneState();
  }
}

class RouteOneState extends State<RouteOne> {
  String params;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('One'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  'This is route one and value return from route two is:$params'),
              RaisedButton(
                child: Text('Open route two'),
                textColor: Colors.blueAccent,
                onPressed: () async {
                  // 打开TipRoute并等待返回结果
                  var result =
                      await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        new RouteTwo(text: '来自Route One传递参数值'),
                  ));
                  setState(() {
                    this.params = result;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
