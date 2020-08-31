import 'package:flutter/material.dart';

class WillPopScopeWidget extends StatefulWidget {
  @override
  WillPopScopeWidgetState createState() {
    return WillPopScopeWidgetState();
  }
}

class WillPopScopeWidgetState extends State<WillPopScopeWidget> {
  DateTime lastPressedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WillPopScope')),
      body: WillPopScope(
        child: Container(
          alignment: Alignment.center,
          child: Text('1秒内连续按两次返回键退出'),
        ),
        onWillPop: () async {
          if (lastPressedTime == null || DateTime.now().difference(lastPressedTime) > Duration(seconds: 1)) {
            // 两次点击间隔超过1秒则重新计时
            lastPressedTime = DateTime.now();
            return false;
          } else {
            return true;
          }
        },
      ),
    );
  }
}