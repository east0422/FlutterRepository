import 'package:flutter/material.dart';

// 混合状态管理(父子类组件状态相互引用)

class TapBoxC extends StatefulWidget {
  TapBoxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  TapBoxCState createState() {
    return TapBoxCState();
  }
}

class TapBoxCState extends State<TapBoxC> {
  bool highlight = false;

  // 点击按下
  void handleTapDown(TapDownDetails details) {
    setState(() {
      highlight = true;
    });
  }

  // 点击松开
  void handleTapUp(TapUpDetails details) {
    setState(() {
      highlight = false;
    });
  }

  // 点击取消
  void handleTapCancel() {
    setState(() {
      highlight = false;
    });
  }

  // 点击处理
  void handleTap() {
    // widget为状态所对应组件
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // 按下时添加绿色边框，抬起时取消高亮
    return Scaffold(
      appBar: AppBar(
        title: Text('TapBoxC'),
      ),
      body: Center(
        child: GestureDetector(
          onTapDown: handleTapDown,
          onTapUp: handleTapUp,
          onTapCancel: handleTapCancel,
          onTap: handleTap,
          child: Container(
            width: 300,
            height: 300,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
              border: highlight
                  ? Border.all(color: Colors.teal[700], width: 10)
                  : null,
            ),
            child: Text(
              widget.active ? 'C-Active' : 'C-InActive',
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class TapBoxCParent extends StatefulWidget {
  @override
  TapBoxCParentState createState() {
    return TapBoxCParentState();
  }
}

class TapBoxCParentState extends State<TapBoxCParent> {
  bool active = false;

  void handleTap(bool newValue) {
    setState(() {
      active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapBoxC(
        active: active,
        onChanged: handleTap,
      ),
    );
  }
}
