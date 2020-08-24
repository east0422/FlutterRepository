import 'package:flutter/material.dart';

class SingleChildScrollViewWidget extends StatelessWidget {
  final String str = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SingleChildScrollView'),
      ),
      body: Scrollbar( // 显示进度条
        child: SingleChildScrollView( // SingleChildScrollView只应在期望内容不会超过屏幕太多时使用，因为它不支持基于Sliver的延迟实例化模型，所以如果预计视口可能包含超出屏幕尺寸太多内容时，那么使用它将会非常昂贵，性能较差
          // reverse: true, // 可滚动组件的初始滚动位置是在“头”还是“尾”，默认为false在“头”
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              // 动态创建一个List<Widget>。每一个字母都用一个Text显示,字体为原来的两倍 
              children: str.split('').map((c) => Text(c, textScaleFactor: 2)) .toList(),
            ),
          ),
        ),
      ),
    );
  }
}