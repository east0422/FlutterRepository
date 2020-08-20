import 'package:flutter/material.dart';

class PaddingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Padding填充'),
      ),
      body: Padding(
        // 上下左右各添加16像素补白
        padding: EdgeInsets.all(16.0),
        child: Column(
          // 显式指定对齐方式为左对齐，排除对齐干扰
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              // 左边添加30像素补白
              padding: const EdgeInsets.only(left: 30),
              child: Text('Hello world'),
            ),
            Padding(
              // 上下各添加50像素补白
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Text('I am Jack'),
            ),
            Padding(
              // 分别指定四个方向的补白
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Text('Your friend'),
            )
          ],
        ),
      ),
    );
  }
}