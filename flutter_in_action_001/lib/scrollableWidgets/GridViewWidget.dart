import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  static List colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.brown,
    Colors.purple
  ];
  final List childrenList = colorList.map((color) => DecoratedBox(decoration: BoxDecoration(color: color))).toList();

  final containerH10 = Container(height: 10, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GridView(
              // scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 5,
                childAspectRatio: 2, // 子元素横轴长度和主轴长度比例值。由于crossAxisCount指定后，子元素横轴长度就确定了，然后通过此参数值就可以确定子元素在主轴的长度
              ),
              children: childrenList,
            ),
          ),
          containerH10,
          Expanded(
            child: GridView.count( 
              crossAxisCount: 3,
              childAspectRatio: 1,
              mainAxisSpacing: 5,
              crossAxisSpacing: 10,
              children: childrenList,
            ),
          ),
          containerH10,
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 120, // 子元素在横轴上的最大长度，之所以是“最大”长度，是因为横轴方向每个子元素的长度仍然是等分的，举个例子，如果ViewPort的横轴长度是450，那么当maxCrossAxisExtent的值在区间[450/4，450/3)内的话，子元素最终实际长度都为112.5，而childAspectRatio所指的子元素横轴和主轴的长度比为最终的长度比。
                mainAxisSpacing: 5,
                crossAxisSpacing: 10,
                childAspectRatio: 3,
              ),
              children: childrenList,
            )
          ),
          containerH10,
          Expanded(
            child: GridView.extent(
              maxCrossAxisExtent: 120,
              mainAxisSpacing: 5,
              crossAxisSpacing: 10,
              childAspectRatio: 3,
              children: childrenList,
            ),
          ),
          containerH10,
          Expanded(
            child: InfiniteGridView(),
          ),
        ],
      )
    );
  }
}

class InfiniteGridView extends StatefulWidget {
  final List colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.brown,
    Colors.purple
  ];
  @override
  InfiniteGridViewState createState() => new InfiniteGridViewState();
}

class InfiniteGridViewState extends State<InfiniteGridView> {

  List datas = [];

  @override
  void initState() {
    super.initState();
    // 初始化数据  
    retrieveDatas();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 10,
          childAspectRatio: 3,
        ),
        itemCount: datas.length,
        itemBuilder: (context, index) {
          // 如果显示到最后一个并且datas总数小于50时继续获取数据
          if (index == datas.length - 1 && datas.length < 50) {
            retrieveDatas();
          }
          return DecoratedBox(decoration: BoxDecoration(color: datas[index]));
        }
    );
  }

  // 模拟异步获取数据
  void retrieveDatas() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        datas.addAll(widget.colorList);
      });
    });
  }
}