import 'package:flutter/material.dart';
import 'package:flutter_in_action_001/Routes.dart' show contextRoute, tapBoxA, tapBoxB, tapBoxC;

class BasicWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基础组件'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(20)),
            FlatButton(
              child: Text('ContextRoute'),
              color: Colors.blue,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                Navigator.pushNamed(context, contextRoute);
              },
            ),
            FlatButton(
              child: Text('TapBoxA'),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, tapBoxA);
              },
            ),
            FlatButton(
              child: Text('TapBoxB'),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, tapBoxB);
              },
            ),
            FlatButton(
              child: Text('TapBoxC'),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, tapBoxC);
              },
            ),
          ],
        )
      ),
    );
  }
}