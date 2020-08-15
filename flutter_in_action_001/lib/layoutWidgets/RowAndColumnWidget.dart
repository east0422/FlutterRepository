import 'dart:ui';

import 'package:flutter/material.dart';

class RowAndColunmWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('线性布局'),
      ),
      body: Column(
        // 测试Row对齐方式，排除Column默认居中对齐的干扰
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('hello world'),
              Text(
                'I am Jack',
                style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.red)
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center, // mainAxisSize设为min该属性值失效
            children: <Widget>[
              Text('hello world'),
              Text(
                'I am Jack',
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Text('hello world'),
              Text(
                'I am Jack',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,  
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text('hello world', style: TextStyle(fontSize: 30.0),),
              Text('I am Jack'),
            ],
          ),
          Center(
            child: Text.rich(
              TextSpan(
                text: 'Hi flutter!',
                style: TextStyle(color: Colors.green),
              )
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: double.infinity), 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('hi'),
                Text('world'),
              ],
            ),
          ),
          Container(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max, // 有效，外层Row宽度为整个屏幕
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    child: Row(
                      mainAxisSize: MainAxisSize.max, // 无效，内层Row宽度为实际高度  
                      children: <Widget>[
                        Text('hello world '),
                        Text('I am Jack '),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.yellowAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Hello'),
                  Text('Hi'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}