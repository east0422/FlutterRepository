import 'package:flutter/material.dart';

class ScrollControllerWidget extends StatefulWidget {

  @override
  ScrollControllerWidgetState createState() {
    return ScrollControllerWidgetState();
  }
}

class ScrollControllerWidgetState extends State<ScrollControllerWidget> {
  ScrollController scrollController = ScrollController();
  bool showBackToTop = false; // 是否显示返回到顶部按钮
  String progress = '0%'; // 进度百分比

  @override
  void initState() {
    super.initState();

    // 监听滚动偏移量
    scrollController.addListener(() {
      // print(scrollController.offset);
      if (scrollController.offset <=  1000 && showBackToTop) {
        setState(() {
          showBackToTop = false;
        });
      } else if (scrollController.offset > 1000 && !showBackToTop) {
        setState(() {
          showBackToTop = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // 避免内存泄漏
    scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScrollController'),
      ),
      body: Scrollbar( // 进度条
        child: NotificationListener<ScrollNotification>( // 滚动通知监听
          onNotification: (ScrollNotification notification) {
            double scrollProgress = notification.metrics.pixels / notification.metrics.maxScrollExtent;
            setState(() {
              progress = '${(scrollProgress * 100).toInt()}%';
            });
            return true;
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(title: Text('${index+1}'));
                },
                itemCount: 100,
                itemExtent: 30,
                controller: scrollController,
              ),
              CircleAvatar( // 显示进度百分比
                radius: 30,
                child: Text(progress),
                backgroundColor: Colors.black54,
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: !showBackToTop ? null : FloatingActionButton(
        onPressed: () => {
          scrollController.animateTo(0, duration: Duration(milliseconds: 200), curve: Curves.ease)
        },
        child: Icon(Icons.arrow_upward),
      ),
    );
  }
}