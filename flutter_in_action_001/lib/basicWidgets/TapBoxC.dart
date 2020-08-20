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
  TextEditingController usernameController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();
  GlobalKey formKey= new GlobalKey<FormState>();

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
        child: SingleChildScrollView( // 解决输入框弹出键盘时bottom overflowed警告
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTapDown: handleTapDown,
                onTapUp: handleTapUp,
                onTapCancel: handleTapCancel,
                onTap: handleTap,
                child: Container(
                  width: 180,
                  height: 150,
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
              Form(
                key: formKey, // 设置globalKey，用于后面获取FormState
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      autofocus: true,
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: '用户名',
                        hintText: '用户名或邮箱',
                        icon: Icon(Icons.person)
                      ),
                      validator: (v) {
                        return v.trim().length > 0 ? null : '用户名不能为空';
                      }
                    ),
                    TextFormField(
                      controller: pwdController,
                      decoration: InputDecoration(
                        labelText: '密码',
                        hintText: '您的登录密码',
                        icon: Icon(Icons.lock)
                      ),
                      obscureText: true,
                      validator: (v) {
                        return v.trim().length > 5 ? null : '密码不能少于6位';
                      }
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            // 通过Builder来获取RaisedButton所在widget树的真正context(Element) 
                            child: Builder(builder: (ctx) {
                              return RaisedButton(
                                padding: EdgeInsets.all(15.0),
                                child: Text('登录'),
                                color: Theme.of(context).primaryColor,
                                textColor: Colors.white,
                                onPressed: () {
                                  // context为TapBoxC的context，而Form.of(context)是根据所指定context向根去查找，而FormState是在TapBoxC的子树中，所以不能使用context，而只能使用ctx。
                                  if (Form.of(ctx).validate()) { // 注意这里需要使用ctx而非context
                                    print('登录初步验证通过!');
                                  }

                                  // // 通过formKey.currentState 获取FormState后，调用validate()方法校验用户名密码是否合法，校验通过后再提交数据
                                  // if((formKey.currentState as FormState).validate()){
                                  //   print('登录初步验证通过!');
                                  // }
                                },
                              );
                            }),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
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
