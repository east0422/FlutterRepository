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
      body: GestureDetector(
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