import 'package:flutter/material.dart';
import 'dart:math' as math;

class TransformWidget extends StatelessWidget {
  final helloFlutter = Text('Hello flutter');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transform变换'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              color: Colors.black,
              child: Transform(
                alignment: Alignment.topRight, // 相对于坐标系原点的对齐方式
                transform: Matrix4.skewY(math.pi/6), // 沿Y轴倾斜30度
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.deepOrange,
                  child: helloFlutter,
                ),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              // 默认原点为左上角，左移20像素，向上平移5像素  
              child: Transform.translate(
                offset: Offset(-20, 5),
                child: helloFlutter,
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.rotate(
                angle: math.pi/2, // 旋转90度
                child: helloFlutter,
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.scale(
                scale: 1.5,
                child: helloFlutter,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DecoratedBox(
                  decoration:BoxDecoration(color: Colors.red),
                  child: Transform.scale(
                    scale: 1.5,
                    child: helloFlutter,
                  ),
                ),
                Text('你好', style: TextStyle(color: Colors.green, fontSize: 18))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),  
                  child: RotatedBox( // 将Transform.rotate换成RotatedBox
                    quarterTurns: 1, // 旋转90度(1/4圈)
                    child: helloFlutter,
                  ),
                ),
                Text('你好', style: TextStyle(color: Colors.green, fontSize: 18),)
              ],
            ),
          ]
        ),
      ),
    );
  }
}