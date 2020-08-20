import 'package:flutter/material.dart';

class DecoratedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('装饰容器'),
      ),
      body: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors:[Colors.red, Colors.orange[700]]), // 背景渐变
            borderRadius: BorderRadius.circular(3), // 3像素圆角
            boxShadow: [ // 阴影
              BoxShadow(
                color: Colors.black54,
                offset: Offset(10, 20),
                blurRadius: 8
              )
            ]
          ),
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
            child: Text('DecoratedBox', style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}