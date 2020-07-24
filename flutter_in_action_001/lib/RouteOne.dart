import 'package:flutter/material.dart';
import 'package:flutter_in_action_001/RouteTwo.dart';
import 'package:flutter_in_action_001/Routes.dart' show routeTwo;

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
                  // 打开RouteTwo并等待返回结果
                  // var result =
                  //     await Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) =>
                  //       new RouteTwo(text: '来自Route One传递参数值'),
                  // ));

                  var result = await Navigator.pushNamed(context, routeTwo,
                      arguments: '来自Route One传递参数');
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
