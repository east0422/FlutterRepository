import 'package:flutter/material.dart';
import 'package:flutter_in_action_001/basicWidgets/Echo.dart';


class ContextRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Echo(text: 'echo widget'),
      ),
      body: Container(
        child: Builder(builder: (context) {
          // 在Widget树中向上查找最近的父级`Scaffold` widget
          Scaffold scaffold = context.findAncestorWidgetOfExactType<Scaffold>();
          // 直接返回AppBar的title，此时实际上是Echo(text: 'echo widget')
          return (scaffold.appBar as AppBar).title;
        }),
      ),
    );
  }
}