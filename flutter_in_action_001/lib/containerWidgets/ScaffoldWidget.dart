import 'package:flutter/material.dart';

class ScaffoldWidget extends StatefulWidget {
  @override
  ScaffoldWidgetState createState() {
    return ScaffoldWidgetState();
  }
}

class ScaffoldWidgetState extends State<ScaffoldWidget> with SingleTickerProviderStateMixin {
  int tabSelectedIndex = 0;
  List tabs = [
    {'title': '主页', 'icon': Icons.home}, 
    {'title': '通知', 'icon': Icons.notifications},
    {'title': '更多', 'icon': Icons.more},
  ];
  TabController tabController;
  // List bottomTabBars;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
    // 添加监听
    tabController.addListener(() { 
      setState(() {
        tabSelectedIndex = tabController.index;
      });
    });
    
    // bottomTabBars = tabs.map((ele) => SizedBox(
    //   child: FlatButton.icon(
    //     icon: Icon(ele['icon']),
    //     label: Text(ele['title']),
    //     onPressed: () {
    //       tabTapped(tabs.indexOf(ele));
    //     },
    //   ),
    // )).toList();
    // bottomTabBars.add(SizedBox());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scaffold、TabBar、底部导航'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Builder(builder: (ctx) {
              return IconButton(
                icon: Icon(Icons.dashboard, color: Colors.white),
                onPressed: () {
                  // Scaffold.of(context)根据所指定context向根去查找，在这里找不到
                  Scaffold.of(ctx).openEndDrawer(); // 打开抽屉菜单  
                },
              );
            }),
          ),
        ],
        bottom: TabBar(
          tabs: tabs.map((ele) => Tab(text: ele['title'])).toList(),
          controller: tabController,
        ),
      ),
      // drawer: ScaffoldDrawer(),
      endDrawer: ScaffoldDrawer(), // 抽屉
      bottomNavigationBar: BottomNavigationBar( // 底部导航
        items: tabs.map((ele) => BottomNavigationBarItem(icon: Icon(ele['icon']), title: Text(ele['title']))).toList(),
        currentIndex: tabSelectedIndex,
        fixedColor: Colors.blue,
        onTap: tabTapped,
      ),
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.white,
      //   shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround, // 均分底部导航栏横向空间
      //     children: bottomTabBars,
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton( // 悬浮按钮
        child: Icon(Icons.add),
        onPressed: addPressed,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: TabBarView(
        controller: tabController,
        children: tabs.map((ele) { // 创建3个Tab页
          return Container(
            alignment: Alignment.center,
            child: Text(ele['title'], textScaleFactor: 5),
          );
        }).toList(),
      ),
    );
  }

  void tabTapped(int index) {
    setState(() {
      tabSelectedIndex = index;
      tabController.index = index;
    });
  }
  void addPressed() {
    setState(() {
      if (tabSelectedIndex >= tabs.length - 1) {
        tabSelectedIndex = 0;
      } else {
        tabSelectedIndex++;
      }
      tabController.index = tabSelectedIndex;
    });
  }
}

class ScaffoldDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true, // 移除抽屉菜单顶部默认留白
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset('assets/images/001.jpg', width: 50),
                    ),
                  ),
                  Text('Wendux', style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                    selected: true,
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}