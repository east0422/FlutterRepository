import 'package:flutter/material.dart';

class ConstrainedWidget extends StatelessWidget {
  final Widget redBox = SizedBox(
    width: 50,
    height: 50,
    child: DecoratedBox(decoration: BoxDecoration(color: Colors.red)),
  );
  
  final circleProgress = SizedBox(
    width: 20, 
    height: 20,
    child: CircularProgressIndicator(
      strokeWidth: 3,
      valueColor: AlwaysStoppedAnimation(Colors.white70),
    ),
  );
  final Widget paddingL10 = Padding(padding: EdgeInsets.only(left: 10));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('尺寸限制类容器'),
        actions: <Widget>[
          CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation(Colors.white70)
          ),
          paddingL10,
          circleProgress,
          paddingL10,
          UnconstrainedBox(child: circleProgress),
          paddingL10,
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: double.infinity, // 宽度尽可能大
              minHeight: 80 // 最小高度为50像素
              ),
            child: Container(
              height: 8,
              child: redBox
            ),
          ),
          redBox,
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 70, minHeight: 70),
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 90, minHeight: 20),
              child: redBox,
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 90, minHeight: 20),
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 70, minHeight: 70),
              child: redBox,
            ),
          ),
          redBox,
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 70, maxHeight: 70),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 90, maxHeight: 20),
              child: redBox,
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 90, maxHeight: 20),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 70, maxHeight: 70),
              child: redBox,
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 60, minHeight: 100), // 父
            child: UnconstrainedBox( // “去除”父级限制
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 90, minHeight: 20), // 子
                child: redBox,
              ),
            ),
          ),
        ],
      )
    );
  }
}
