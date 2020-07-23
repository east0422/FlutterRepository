import 'package:flutter/material.dart';
import 'package:flutter_in_action_001/RouteOne.dart';
import 'package:flutter_in_action_001/RouteTwo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // navigatorKey: new GlobalKey(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        // 注册路由表
        '/': (context) => MyHomePage(title: 'Flutter Demo Home Page'),
        'one': (context) => RouteOne(),
        'two': (context) {
          return RouteTwo(text: ModalRoute.of(context).settings.arguments);
        },
      },
      onGenerateRoute: (RouteSettings settings) {
        // 当通过跳转路由在routes查找不到时会调用该方法
        return MaterialPageRoute(builder: (context) {
          print('settings: $settings');
          return MyHomePage(title: 'Welcome to flutter');
        });
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            FlatButton(
              child: Text("Open route one"),
              textColor: Colors.blueGrey,
              onPressed: () {
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => new RouteOne()));

                Navigator.pushNamed(context, 'one');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerFloat, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
