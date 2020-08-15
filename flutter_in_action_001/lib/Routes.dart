import 'package:flutter/material.dart';
import 'package:flutter_in_action_001/Home.dart';
import 'package:flutter_in_action_001/RouteOne.dart';
import 'package:flutter_in_action_001/RouteTwo.dart';
// basicWidgets
import 'package:flutter_in_action_001/BasicWidgets.dart';
import 'package:flutter_in_action_001/basicWidgets/ContextRoute.dart';
import 'package:flutter_in_action_001/basicWidgets/ImageFit.dart';
import 'package:flutter_in_action_001/basicWidgets/TapBoxA.dart';
import 'package:flutter_in_action_001/basicWidgets/TapBoxB.dart';
import 'package:flutter_in_action_001/basicWidgets/TapBoxC.dart';
// layoutWidgets
import 'package:flutter_in_action_001/LayoutWidgets.dart';
import 'package:flutter_in_action_001/layoutWidgets/AlignWidget.dart';
import 'package:flutter_in_action_001/layoutWidgets/FlexWidget.dart';
import 'package:flutter_in_action_001/layoutWidgets/RowAndColumnWidget.dart';
import 'package:flutter_in_action_001/layoutWidgets/StackAndPositionedWidget.dart';
import 'package:flutter_in_action_001/layoutWidgets/WrapAndFlowWidget.dart';

// 路由名称，其他地方使用路由名称从这里获取，避免直接使用字符串造成拼写错误
final String home = '/';
final String routeOne = '/routeOne';
final String routeTwo = '/routeTwo';
// basicWidgets
final String basicWidgets = '/basicWidgets';
final String contextRoute = '/basicWidgets/contextRoute';
final String tapBoxA = '/basicWidgets/tapBoxA';
final String tapBoxB = '/basicWidgets/tapBoxB';
final String tapBoxC = '/basicWidgets/tapBoxC';
final String imageFit = '/basicWidgets/imageFit';
// layoutWidgets
final String layoutWidgets = '/layoutWidgets';
final String rowAndColumnWidget = '/layoutWidgets/rowAndColumnWidgets';
final String flexWidget = '/layoutWidgets/flexWidget';
final String wrapAndFlowWidget = '/layoutWidgets/wrapAndFlowWidget';
final String stackAndPositionedWidget = '/layoutWidgets/stackAndPositionedWidget';
final String alignWidget = '/layoutWidgets/alignWidget';

// 路由表
final Map<String, WidgetBuilder> routes = {
  home: (context) => Home(title: 'Welcome to futter', initCounter: 100),
  routeOne: (context) => RouteOne(),
  routeTwo: (context, {arguments}) => RouteTwo(text: (ModalRoute.of(context).settings.arguments) ?? arguments), // 使用onGenerateRoute以路径名称跳转到routeTwo时{arguments}有值而settings.arguments为null
  // basicWidgets
  basicWidgets: (context) => BasicWidgets(),
  contextRoute: (context) => ContextRoute(),
  tapBoxA: (context) => TapBoxA(),
  tapBoxB: (context) => TapBoxBParent(), // 父类管理状态
  tapBoxC: (context) => TapBoxCParent(), // 混合管理状态
  imageFit: (context) => ImageFit(),
  // layoutWidgets
  layoutWidgets: (context) => LayoutWidgets(),
  rowAndColumnWidget: (context) => RowAndColunmWidget(),
  flexWidget: (context) => FlexWidget(),
  wrapAndFlowWidget: (context) => WrapAndFlowWidget(),
  stackAndPositionedWidget: (context) => StackAndPositionedWidget(),
  alignWidget: (context) =>  AlignWidget(),
};

// 调用Navigator.pushNamed(...)打开命名路由时，如果指定的路由名在路由表中已注册，则会调用路由表中的builder函数来生成路由组件；如果路由表中没有注册，才会调用onGenerateRoute来生成路由
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
