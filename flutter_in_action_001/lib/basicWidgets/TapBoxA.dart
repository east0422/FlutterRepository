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
  bool switchSelected = true;
  bool checkboxSelected = true;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Hello Flutter',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                height: 1.2,  
                fontFamily: 'Courier',
                background: Paint()..color=Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed
              ),
            ),
            Image(
              image: AssetImage('assets/images/003.jpg'),
            ),
            Image(
              image: NetworkImage('https://cdn.jsdelivr.net/gh/flutterchina/website@1.0/images/flutter-mark-square-100.png'), width: 100,
            ),
            GestureDetector(
              onTap: handleTap,
              child: Container(
                width: 200,
                height: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: active ? Colors.lightGreen[700] : Colors.grey[600],
                ),
                child: Text(
                  active ? 'A-Active' : 'A-InActive',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
              )
            ),
            SizedBox( // Switch只能定义宽度，高度也是固定的
              width: 100,
              // height: 20, // 高度无效
              child: Switch(
                value: switchSelected,
                onChanged:(newValue){
                  // 重新构建页面  
                  setState(() {
                    switchSelected = newValue;
                  });
                },
              ),
            ),
            Checkbox( // Checkbox的大小是固定的，无法自定义
              value: checkboxSelected,
              activeColor: Colors.red,
              onChanged:(newValue){
                setState(() {
                  checkboxSelected = newValue;
                });
              },
            )
          ],
        )
      ),
    );
  }
}
