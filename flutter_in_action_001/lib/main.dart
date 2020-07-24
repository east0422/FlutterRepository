import 'package:flutter/material.dart';
import 'package:flutter_in_action_001/Routes.dart' as mRoutes;

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
      initialRoute: mRoutes.home,
      routes: mRoutes.routes,
      onGenerateRoute: mRoutes.onGenerateRoute,
      onUnknownRoute: mRoutes.onUnknownRoute,
    );
  }
}
