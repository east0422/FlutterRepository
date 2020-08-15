import 'package:flutter/material.dart';
import 'package:flutter_in_action_001/Routes.dart' show rowAndColumnWidget, flexWidget, wrapAndFlowWidget, stackAndPositionedWidget, alignWidget;

// 定义一个实体类，存储按钮显示title和点击按钮后跳转routeName
class TitleAndRouteName {
  const TitleAndRouteName({this.title, this.routeName});

  final String title;
  final String routeName;
}

class LayoutWidgets extends StatelessWidget {
  final List<TitleAndRouteName> list1 = [
    TitleAndRouteName(title: '线性布局', routeName: rowAndColumnWidget),
    TitleAndRouteName(title: '弹性布局', routeName: flexWidget),
    TitleAndRouteName(title: '流式布局', routeName: wrapAndFlowWidget),
    TitleAndRouteName(title: '层叠布局', routeName: stackAndPositionedWidget),
    TitleAndRouteName(title: '对齐与相对定位', routeName: alignWidget),
  ];

  // final List<Map> list2 = [
  //   {'title': '线性布局', 'routeName': rowAndColumnWidget},
  //   {'title': '弹性布局', 'routeName': flexWidget},
  //   {'title': '流式布局', 'routeName': wrapAndFlowWidget},
  //   {'title': '层叠布局', 'routeName': stackAndPositionedWidget},
  //   {'title': '对齐与相对定位', 'routeName': alignWidget},
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('布局类组件'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: list1.map((ele) => FlatButton(
            child: Text(ele.title),
            color: Colors.blue,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {
              Navigator.pushNamed(context, ele.routeName);
            },
          )).toList(),
          // children: list2.map((dic) => FlatButton(
          //   child: Text(dic['title']),
          //   color: Colors.blue,
          //   textColor: Colors.white,
          //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          //   onPressed: () {
          //     Navigator.pushNamed(context, dic['routeName']);
          //   },
          // )).toList(),
        ),
      ),
    );
  }
}