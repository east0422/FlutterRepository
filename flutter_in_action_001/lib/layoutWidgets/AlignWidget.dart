import 'package:flutter/material.dart';

class AlignWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('对齐与相对定位'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              // height: 120,
              // width: 120,
              color: Colors.blue[50],
              child: Align(
                widthFactor: 3,
                heightFactor: 2,
                alignment: Alignment.centerRight,
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            Container(
              height: 120,
              width: 120,
              color: Colors.blue[50],
              child: Align(
                alignment: FractionalOffset(0.1, 0.9),
                child: Icon(
                  Icons.home,
                  size: 60,
                  color: Colors.red,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Center(
                widthFactor: 10,
                heightFactor: 3,
                child: Text('xxx'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}