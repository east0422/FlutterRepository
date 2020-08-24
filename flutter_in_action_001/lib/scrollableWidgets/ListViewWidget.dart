import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  //下划线widget预定义以供复用。
  final Widget redDivider = Divider(color: Colors.red, height: 1);
  final Widget blueDivider = Divider(color: Colors.blue, height: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: ListView(
              shrinkWrap: true, // 是否根据子组件的总长度来设置ListView的长度，默认值为false。默认情况下，ListView会在滚动方向尽可能多的占用空间。当ListView在一个无边界(滚动方向上)的容器中时，shrinkWrap必须为true。
              padding: const EdgeInsets.only(top: 20),
              // 可滚动组件通过一个List来作为其children属性时，只适用于子组件较少的情况，因为这种方式需要将所有children都提前创建好(这需要做大量工作)，而不是等到子widget真正显示的时候再创建，也就是说通过默认构造函数构建的ListView没有应用基于Sliver的懒加载模型。实际上通过此方式创建的ListView和使用SingleChildScrollView+Column的方式没有本质的区别。
              children: <Widget>[
                const Text('Hello'),
                const Text('Hi'),
                const Text('How are you'),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 20),
              itemCount: 50,
              // itemExtent: 20, // 强制高度为20
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text('${index + 1}'));
              }
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 50,
              // 列表项构造器
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text("${index + 1 }"));
              },
              // 分割器构造器
              separatorBuilder: (BuildContext context, int index) {
                return index%2 == 0 ? redDivider : blueDivider;
              },
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                ListTile(title: Text('固定表头')),
                Expanded(
                  child: InfiniteListView(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 无限加载列表
// 从数据源异步分批拉取一些数据，然后用ListView展示，当滑动到列表末尾时，判断是否需要再去拉取数据，如果是则去拉取，拉取过程中在表尾显示一个loading，拉取成功后将数据插入列表；如果不需要再去拉取，则在表尾提示"没有更多"。
class InfiniteListView extends StatefulWidget {
  @override
  InfiniteListViewState createState() => new InfiniteListViewState();
}

class InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = '##loading##'; // 表尾标记
  var words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: words.length,
      itemBuilder: (context, index) {
        if (words[index] == loadingTag) { // 如果到了表尾
          if (words.length - 1 < 50) { // 不足50条，继续获取数据
            retrieveData(); // 获取数据
            // 加载时显示loading
            return Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2)
              ),
            );
          } else { // 已经加载了50条数据，不再获取数据
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16),
              child: Text('没有更多了', style: TextStyle(color: Colors.grey),)
            );
          }
        }
        return ListTile(title: Text(words[index])); // 显示单词列表项
      },
      separatorBuilder: (context, index) => Divider(color: Colors.black38, height: 1),
    );
  }

  void retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        // 重新构建列表
        words.insertAll(words.length - 1,
          // 每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
        );
      });
    });
  }
}