import 'package:flutter/material.dart';
import 'package:flutter_in_action_001/Home.dart';
import 'package:flutter_in_action_001/RouteOne.dart';
import 'package:flutter_in_action_001/RouteTwo.dart';

// 路由名称，其他地方使用路由名称从这里获取，避免直接使用字符串造成拼写错误
final String home = '/';
final String routeOne = '/routeOne';
final String routeTwo = '/routeTwo';

// 路由表
final Map<String, WidgetBuilder> routes = {
  home: (context) => Home(title: 'Welcome to futter'),
  routeOne: (context) => RouteOne(),
  routeTwo: (context, {arguments}) => RouteTwo(text: (ModalRoute.of(context).settings.arguments) ?? arguments), // 使用onGenerateRoute以路径名称跳转到routeTwo时{arguments}有值而settings.arguments为null
};

// ignore: top_level_function_literal_block
final onGenerateRoute = (RouteSettings settings) {
  final String routeName = settings.name;
  final Function widgetBuilder = routes[routeName];
  if (widgetBuilder != null) {
    // 找到了对应名称的路由
    if (settings.arguments != null) {
      // 有参数
      return MaterialPageRoute(
          builder: (context) =>
              widgetBuilder(context, arguments: settings.arguments));
    } else {
      return MaterialPageRoute(
          builder: (context) => widgetBuilder(context));
    }
  } else {
    return MaterialPageRoute(builder: (context) {
      return UnKnownPage();
    });
  }
};

// ignore: top_level_function_literal_block
final onUnknownRoute = (RouteSettings setttings) =>
    MaterialPageRoute(builder: (context) => UnKnownPage());

class UnKnownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('跳转错误'),
        centerTitle: true,
      ),
    );
  }
}
