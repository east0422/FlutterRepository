import 'package:flutter/material.dart';
import 'package:flutter_in_action_001/RandomWordsWidget.dart';
import 'package:flutter_in_action_001/Routes.dart' show routeOne, basicWidgets, layoutWidgets;

class Home extends StatefulWidget {
  Home({Key key, this.title, this.initCounter: 0}) : super(key: key);

  final String title;
  final int initCounter;

  @override
  HomeState createState() => HomeState();

  // 默认约定：若StatefulWidget的状态State是希望暴露的，应当在StatefulWidget中提供一个of静态方法来获取其State对象；若不希望State暴露则不提供of方法。
  static HomeState of(BuildContext context, {bool rootHome = false}) {
    final HomeState homeState = rootHome ? context.findRootAncestorStateOfType<HomeState>() : context.findAncestorStateOfType<HomeState>();
    return homeState;
  }
}

class HomeState extends State<Home> {
  int counter = 0;
  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  // 当widget第一次插入到widget树时会被调用，对于每一个State对象只会调用一次该回调
  @override
  void initState() { // 初始化状态
    super.initState();
    counter = widget.initCounter;
    print('initState');
  }

  // 用于构建widget树，会在调用initState/didUpdateWidget/setState/didChangeDependencies之后被调用，还会在State对象从树中一个位置移除(会调用deactivate)又重新插入到树的其它位置之后被调用
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(5, 30, 5, 50),
              child: Image.asset('assets/images/001.jpg'),
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.red),
            ),
            RandomWordsWidget(textColor: Colors.green), // 随机字符串
            FlatButton(
              child: Text('Open route one'),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, routeOne);
              },
            ),
            MaterialButton(
              child: Text('基础组件'),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () => Navigator.pushNamed(context, basicWidgets)
            ),
            MaterialButton(
              child: Text('布局类组件'),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () => Navigator.pushNamed(context, layoutWidgets)
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerFloat, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // 当State对象的依赖发生变化时会被调用(eg,上面build中包含了一个InheritedWidget，然后在之后的build中InheritedWidget发生了变化，那么此时InheritedWidget的子widget的didChangeDependencies回调都会被调用)，常用场景是当系统语言Locale或应用主题改变时，Flutter framework会通知widget调用此回调
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  // 在widget重新构建时，Flutter framework会调用widget.canUpdate来检测widget树中同一位置的新旧节点，然后决定是否需要更新，若canUpdate返回true则会调用此回调。
  @override
  void didUpdateWidget(Home oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  // 当State对象从树中被移除时会调用该回调。在一些场景下Flutter framework会将State对象重新插到树中，如包含此State对象的子树在树的一个位置移动到另一个位置时(可通过GlobalKey来实现)。若移除后没有重新插入到树中则紧接这会调用dispose方法
  @override
  void deactivate() {
    print('deactivate');
    super.deactivate();
  }

  // 当State对象冲树中被永久移除时会调用该回调，通常在该回调中释放资源
  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  // 此回调是专门为了开发调试而提供的，在热重载(Hot reload)时会被调用，此Release模式下永远不会被调用
  @override
  void reassemble() {
    super.reassemble();
    print('reassemble');
  }
}