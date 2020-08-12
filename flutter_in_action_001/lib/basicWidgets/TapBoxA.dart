import 'package:flutter/material.dart';

class TapBoxA extends StatefulWidget {
  TapBoxA({Key key}) : super(key: key);

  @override
  TapBoxAState createState() {
    return TapBoxAState();
  }
}

class TapBoxAState extends State<TapBoxA> {
  bool active = false;

  void handleTap() {
    setState(() {
      active = !active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TapBoxA'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: handleTap,
          child: Container(
            width: 200,
            height: 300,
            decoration: BoxDecoration(
              color: active ? Colors.lightGreen[700] : Colors.grey[600],
            ),
            child: Center(
              child: Text(
                active ? 'A-Active' : 'A-InActive',
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
            ),
          )
        ),
      ),
    );
  }
}
