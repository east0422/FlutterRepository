import 'package:flutter/material.dart';

class TapBoxB extends StatelessWidget {
  TapBoxB({Key key, this.active: false, @required this.onChanged}) : super(key: key);
  
  final bool active;
  final ValueChanged<bool> onChanged;

  void handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TapBoxB'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: handleTap,
            child: Center(
              child: Container(
                width: 200,
                height: 200,
                alignment: Alignment.center,
                color: active ? Colors.lightGreen[700] : Colors.grey[600],
                child: Text(
                  active ? 'B-Active' : 'B-InActive',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: '用户名',
                    hintText: '用户名或邮箱',
                    prefixIcon: Icon(Icons.person)
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '您的登录密码',
                    prefixIcon: Icon(Icons.lock)
                  ),
                  obscureText: true,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                  child: SizedBox(
                    height: 10,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.red[200],
                      valueColor: AlwaysStoppedAnimation(Colors.green),
                      // value: .5, // 为null时则指示器会执行一个循环动画(模糊进度)
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                    // value: 0.7, // 为null时则指示器会执行一个循环动画(模糊进度)
                  ),
                ),
              ]
            )
          ),
        ],
      )
    );
  }
}

// TapBoxBParent为TapBoxB管理状态
class TapBoxBParent extends StatefulWidget {
  @override
  TapBoxBParentState createState() {
    return TapBoxBParentState();
  }
}

class TapBoxBParentState extends State<TapBoxBParent> {
  bool active = false;

  void handleTapBoxBChanged(bool newValue) {
    setState(() {
      active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapBoxB(
        active: active,
        onChanged: handleTapBoxBChanged,
      )
    );
  }
}