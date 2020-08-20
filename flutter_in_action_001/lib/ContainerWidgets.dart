import 'package:flutter/material.dart';
import 'package:flutter_in_action_001/Routes.dart' show paddingWidget, constrainedWidget, decoratedWidget, transformWidget, containerWidget, scaffoldWidget, clipWidget;

class ContainerWidgets extends StatelessWidget {
  final List<Map> list = [
    {'title': '填充', 'routeName': paddingWidget},
    {'title': '尺寸限制类容器', 'routeName': constrainedWidget},
    {'title': '装饰容器', 'routeName': decoratedWidget},
    {'title': '变换', 'routeName': transformWidget},
    {'title': 'Container容器', 'routeName': containerWidget},
    {'title': 'Scaffold、TabBar、底部导航', 'routeName': scaffoldWidget},
    {'title': '剪裁', 'routeName': clipWidget},
  ];

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text('容器类组件'),
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