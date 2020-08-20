import 'package:flutter/material.dart';

class ClipWidget extends StatelessWidget {
  final Widget avatar = Image.asset('assets/images/001.jpg');
  final helloWorld = Text('你好世界', style: TextStyle(color: Colors.green));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clip剪裁'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            avatar, // 不剪裁
            ClipOval(child: avatar), // 剪裁为圆形
            ClipRRect( // 剪裁为圆角矩形
              borderRadius: BorderRadius.circular(15),
              child: avatar,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5, // 宽度设为原来宽度一半，另一半会溢出
                  child: avatar,
                ),
                helloWorld
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRect( // 将溢出部分剪裁
                  child: Align(
                    alignment: Alignment.topLeft,
                    widthFactor: .5, // 宽度设为原来宽度一半
                    child: avatar,
                  ),
                ),
                helloWorld
              ],
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.red
              ),
              child: ClipRect(
                  clipper: MyClipper(), // 使用自定义的clipper
                  child: avatar
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 截取图片中部widthxheight(默认40×30)像素的范围
class MyClipper extends CustomClipper<Rect> {
  MyClipper({this.width: 40, this.height: 30});
  final double width;
  final double height;
  @override
  Rect getClip(Size size) => Rect.fromLTWH((size.width - width)/2, (size.height - height)/2, width, height);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}