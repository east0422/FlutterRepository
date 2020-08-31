import 'package:flutter/material.dart';

class ThemeAndColorWidget extends StatefulWidget {
  @override
  ThemeAndColorWidgetState createState() {
    return ThemeAndColorWidgetState();
  }
}

class ThemeAndColorWidgetState extends State<ThemeAndColorWidget> {
  Color themeColor = Colors.teal; // 当前路由主题色

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme(
      data: ThemeData(
          primarySwatch: themeColor, // 用于导航栏、FloatingActionButton的背景色等
          iconTheme: IconThemeData(color: themeColor) // 用于Icon颜色
      ),
      child: Scaffold(
        appBar: AppBar(title: Text('主题测试')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // 背景为蓝色，则title自动为白色
            NavBar(color: Colors.blue, title: '标题'), 
            // 背景为白色，则title自动为黑色
            NavBar(color: Colors.white, title: '标题'),

            // 该行Icon使用主题中的iconTheme
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.favorite),
                Icon(Icons.airport_shuttle),
                Text('  颜色跟随主题'),
              ]
            ),
            // 为该行Icon自定义颜色（固定为黑色)
            Theme(
              data: themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(
                  color: Colors.black
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.favorite),
                  Icon(Icons.airport_shuttle),
                  Text('  颜色固定黑色')
                ]
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() =>
              // 切换主题
              themeColor = themeColor == Colors.teal ? Colors.blue : Colors.teal
            );
          },
          child: Icon(Icons.palette)
        ),
      ),
    );
  }
}

// 实现一个背景颜色和Title可以自定义的导航栏，并且背景色为深色时我们应该让Title显示为浅色；背景色为浅色时，Title显示为深色。
class NavBar extends StatelessWidget {
  final String title;
  final Color color; // 背景颜色

  NavBar({
    Key key,
    this.color,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 52,
        minWidth: double.infinity,
      ),
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow( // 阴影
            color: Colors.black26,
            offset: Offset(0, 3),
            blurRadius: 3,
          ),
        ],
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          // 根据背景色亮度来确定Title颜色
          color: color.computeLuminance() < 0.5 ? Colors.white : Colors.black,
        ),
      ),
      alignment: Alignment.center,
    );
  }
}