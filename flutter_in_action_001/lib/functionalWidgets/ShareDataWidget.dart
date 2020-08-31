import 'package:flutter/material.dart';

class ShareDataWidget extends StatefulWidget {
  @override
  ShareDataWidgetState createState() {
    return ShareDataWidgetState();
  }
}

class ShareDataWidgetState extends State<ShareDataWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('InheritedWidget')),
      body: Center(
        child: ShareWidget(
          clickCount: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ShareChildWidget(),
              ),
              RaisedButton(
                onPressed: () => setState(() => ++count),
                child: Text('Increment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShareWidget extends InheritedWidget {
  ShareWidget({this.clickCount: 0, Widget child}): super(child: child);
  final int clickCount; // 点击次数，需在子树中共享的数据

   // 该回调决定当clickCount发生变化时，是否通知子树中依赖data的Widget  
  @override
  bool updateShouldNotify(ShareWidget oldWidget) {
    // 如果返回true，则子树中依赖(build函数中有调用)本widget的子widget的`state.didChangeDependencies`会被调用
    return oldWidget.clickCount != clickCount;
  }

  // 定义一个便捷方法，方便子树中的widget获取共享数据  
  static ShareWidget of(BuildContext context) {
    // dependOnInheritedWidgetOfExactType会注册依赖关系，之后当InheritedWidget发生变化时，就会更新依赖它的子孙组件，也就是会调这些子孙组件的didChangeDependencies方法和build方法。
    // return context.dependOnInheritedWidgetOfExactType<ShareWidget>();

    // getElementForInheritedWidgetOfExactType不会注册依赖关系，所以当InheritedWidget发生变化时，就不会更新相应的子孙Widget。
    return context.getElementForInheritedWidgetOfExactType<ShareWidget>().widget;
  }
}

class ShareChildWidget extends StatefulWidget {
  @override
  ShareChildWidgetState createState() {
    return ShareChildWidgetState();
  }
}

class ShareChildWidgetState extends State<ShareChildWidget> {
  @override
  Widget build(BuildContext context) {
    // 使用InheritedWidget中的共享数据
    return Text(ShareWidget.of(context).clickCount.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    // 如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print('Dependencies change');
  }
}