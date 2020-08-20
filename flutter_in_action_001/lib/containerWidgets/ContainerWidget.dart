import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final helloFlutter = Text('Hello flutter');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container容器'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50, left: 120), // 容器外填充
              constraints: BoxConstraints.tightFor(width: 200, height: 150), // 卡片大小
              decoration: BoxDecoration( // 背景装饰
                gradient: RadialGradient( // 背景径向渐变
                    colors: [Colors.red, Colors.orange],
                    center: Alignment.topLeft,
                    radius: .98
                ),
                boxShadow: [ //卡片阴影
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(4, 2),
                    blurRadius: 4
                  )
                ]
              ),
              transform: Matrix4.rotationZ(.2), // 卡片倾斜变换
              alignment: Alignment.center, // 卡片内文字居中
              child: Text( // 卡片文字
                '5.20', style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20), // 容器外补白
              color: Colors.orange,
              child: helloFlutter,
            ),
            Container(
              padding: EdgeInsets.all(20), // 容器内补白
              color: Colors.orange,
              child: helloFlutter,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.orange),
                child: helloFlutter,
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.orange),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: helloFlutter,
              ),
            ),
          ],
        ),
      ),
    );
  }
}