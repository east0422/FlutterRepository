import 'package:flutter/material.dart';
import 'package:flutter_in_action_001/Routes.dart' show willPopScopeWidget, shareDataWidget, crossWidget, themeAndColorWidget, asyncUpdateUIWidget, dialogWidget;

class FunctionalWidgets extends StatelessWidget {
  final List<Map> list = [
    {'title': '导航返回拦截', 'routeName': willPopScopeWidget},
    {'title': '数据共享', 'routeName': shareDataWidget},
    {'title': '跨组件状态共享', 'routeName': crossWidget},
    {'title': '颜色和主题', 'routeName': themeAndColorWidget},
    {'title': '异步UI更新', 'routeName': asyncUpdateUIWidget},
    {'title': '对话框', 'routeName': dialogWidget},
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