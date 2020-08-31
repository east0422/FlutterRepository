import 'package:flutter/material.dart';

class DialogWidget extends StatefulWidget {
  @override
  DialogWidgetState createState() => DialogWidgetState();
}

class DialogWidgetState extends State<DialogWidget> {
  bool withTree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('对话框'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('确认删除'),
              onPressed: () async {
                // 弹出对话框并等待其关闭
                bool delete = await showDeleteConfirmDialog1();
                if (delete == null) {
                  print('取消删除');
                } else {
                  print('已确认删除, 同时删除子目录: $delete');
                }
              },
            ),
            RaisedButton(
              child: Text('更改语言'),
              onPressed: () async {
                await changeLanguage();
              },
            ),
            RaisedButton(
              child: Text('列表对话框'),
              onPressed: () async {
                await showListDialog();
              },
            ),
          ],
        ),
      ),
    );
  }

  // 弹出对话框
  Future<bool> showDeleteConfirmDialog1() {
    withTree = false;
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('提示'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('您确定要删除当前文件吗?'),
              Row(
                children: <Widget>[
                  Text('同时删除子目录？'),
                  DialogCheckbox(
                    value: withTree,
                    onChanged: (bool value) {
                      withTree = !withTree;
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('取消'),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            FlatButton(
              child: Text('删除'),
              onPressed: () {
                Navigator.of(context).pop(withTree);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> changeLanguage() async {
    int i = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('请选择语言'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                // 返回1
                Navigator.pop(context, 1);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text('中文简体'),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                // 返回2
                Navigator.pop(context, 2);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text('美国英语'),
              ),
            ),
          ],
        );
      });

    if (i != null) {
      print('选择了：${i == 1 ? '中文简体' : '美国英语'}');
    }
  }

  Future<void> showListDialog() async {
    int index = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        var child = Column(
          children: <Widget>[
            ListTile(title: Text('请选择')),
            Expanded(
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('$index'),
                    onTap: () => Navigator.of(context).pop(index),
                  );
                },
              ),
            ),
          ],
        );
        // 使用AlertDialog会报错
        // return AlertDialog(content: child);
        return Dialog(child: child);
      },
    );
    if (index != null) {
      print('点击了：$index');
    }
  }
}

// 单独封装一个内部管理选中状态的复选框组件
class DialogCheckbox extends StatefulWidget {
  DialogCheckbox({
    Key key,
    this.value,
    @required this.onChanged,
  });

  final ValueChanged<bool> onChanged;
  final bool value;

  @override
  DialogCheckboxState createState() => DialogCheckboxState();
}

class DialogCheckboxState extends State<DialogCheckbox> {
  bool value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (v) {
        // 将选中状态通过事件的形式抛出
        widget.onChanged(v);
        setState(() {
          // 更新自身选中状态
          value = v;
        });
      },
    );
  }
}
