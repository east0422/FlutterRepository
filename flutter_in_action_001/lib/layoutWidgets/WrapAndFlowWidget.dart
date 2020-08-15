import 'package:flutter/material.dart';

class WrapAndFlowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('流式布局'),
      ),
      body: Column(
        children: <Widget>[
          Wrap(
            spacing: 8.0, // 主轴(水平)方向间距
            runSpacing: 4.0, // 纵轴（垂直）方向间距
            alignment: WrapAlignment.start, // 主轴方向居中
            children: <Widget>[
              Chip(
                avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
                label: Text('Hamilton'),
              ),
              Chip(
                avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
                label: Text('Lafayette'),
              ),
              Chip(
                avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
                label: Text('Mulligan'),
              ),
              Chip(
                avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
                label: Text('Laurens'),
              ),
            ],
          ),
          Flow(
            delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
            children: <Widget>[
              Container(width: 80.0, height:80.0, color: Colors.red,),
              Container(width: 80.0, height:80.0, color: Colors.green,),
              Container(width: 80.0, height:80.0, color: Colors.blue,),
              Container(width: 50.0, height:50.0,  color: Colors.yellow,),
              Container(width: 50.0, height:50.0, color: Colors.brown,),
              Container(width: 50.0, height:50.0,  color: Colors.purple,),
              Container(width: 100.0, height:100.0,  color: Colors.black38,),
              Container(width: 100.0, height:100.0, color: Colors.cyan,),
              Container(width: 100.0, height:100.0,  color: Colors.orange,),
            ],
          ),
        ],
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  TestFlowDelegate({this.margin});
  EdgeInsets margin = EdgeInsets.zero;

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    var marginT = margin.top;
    // 计算每一个子widget的位置  
    for (int i = 0; i < context.childCount; i++) {
      var childSize = context.getChildSize(i);
      var w = childSize.width + x + margin.right;
      if (w < context.size.width) {
        print('x: $x, y: $y');
        context.paintChild(i, transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
        if (childSize.height > marginT) {
          marginT = childSize.height;
        }
      } else {
        x = margin.left;
        y += marginT + margin.top + margin.bottom;
        print('x: $x, y: $y');
        // 绘制子widget(有优化)  
        context.paintChild(i, transform: new Matrix4.translationValues(x, y, 0.0));
        x += childSize.width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) { // 返回固定大小来指定Flow的大小
    return Size(double.infinity, 350);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return this != oldDelegate;
  }
}